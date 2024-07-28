//
//  PlaceViewModel.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import Foundation
import CoreData
import SwiftUI


final class PlaceViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var isPresentNewPlace = false
    
    @Published var places: [Place] = []
    @Published var cars: [Car] = []
    
    @Published var simplePlaceTitle = ""
    @Published var simpleAdress = ""
    
    @Published var simpleCarTitle = ""
    @Published var simpleCarImage = ImageResource.car1
    @Published var simpleCars: [String] = []
    @Published var simpleCarImageArray: [ImageResource] = []
    @Published var countCars = 0
    
    init(){
        getPlace()
        getCars()
    }
    
    //MARK: - addNewCarCell
    func addNewCarCell(){
            simpleCars.append(simpleCarTitle)
            simpleCarImageArray.append(simpleCarImage)
            countCars += 1
        
    }
    
    //MARK: - Add Place
    func addPlace(){
        let newPlace = Place(context: manager.context)
        newPlace.placetitle = simplePlaceTitle
        newPlace.adress = simpleAdress
        
        var index = 0
        for simpleCar in simpleCars {
            if !simpleCar.isEmpty {
                addCar(carTitle: simpleCar, carImage: simpleCarImageArray[index], place: newPlace)
            }
            index += 1
        }
        
        save()
        clear()
    }
    
    //MARK: - Add one car
    func addCar(carTitle: String, carImage: ImageResource, place: Place){
        let newCar = Car(context: manager.context)
        newCar.carTitle = carTitle
        newCar.carImage = UIImage(resource: carImage)
        newCar.place = place
    }
    
    //MARK: - Get data
    func getPlace(){
        let request = NSFetchRequest<Place>(entityName: "Place")
        
        do{
            places = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getCars(){
        let request = NSFetchRequest<Car>(entityName: "Car")
        
        do{
            cars = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear property
    func clear(){
        simplePlaceTitle = ""
        simpleAdress = ""
        simpleCarTitle = ""
        simpleCarImage = ImageResource.car1
        simpleCars.removeAll()
        simpleCarImageArray.removeAll()
        countCars = 0
    }
    
    //MARK: - Save data
    func save(){
        places.removeAll()
        manager.save()
        getPlace()
    }
}
