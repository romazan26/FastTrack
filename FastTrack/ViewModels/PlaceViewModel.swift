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
    @Published var isPresentEditeWorkers = false
    @Published var isPresentAllCars = false
    
    @Published var places: [Place] = []
    @Published var cars: [Car] = []
    @Published var workers: [Worker] = []
    
    @Published var simpleWorkerName = ""
    @Published var simpleWorkerImage: UIImage = .test
    @Published var simpleWorkers: [String] = []
    @Published var simpleWorkersImages: [UIImage] = []
    @Published var countWorkers = 0
    
    @Published var simplePlaceTitle = ""
    @Published var simpleAdress = ""
    @Published var simplePlaceSolary = ""
    
    @Published var simpleCarTitle = ""
    @Published var simpleCarImage = ImageResource.car1
    @Published var simpleCars: [String] = []
    @Published var simpleCarImageArray: [ImageResource] = []
    @Published var countCars = 0
    
    @Published var allSalary = 0
    
    init(){
        getPlace()
        getCars()
        getWorkers()
        getAllSalary()
    }
    
    //MARK: - Get all salary
    func getAllSalary() {
        allSalary = 0
        getPlace()
        if !places.isEmpty{
            for place in places {
                allSalary += Int(place.salary)
            }
        }
        
    }
    
    //MARK: - Delte
    func deleteWorker(worker: Worker){
        manager.container.viewContext.delete(worker)
            save()
    }
    func deleteCar(car: Car){
        manager.container.viewContext.delete(car)
        save()
    }
    func deletePlace(place: Place){
        manager.container.viewContext.delete(place)
        save()
    }
    
    //MARK: - Update Place solary
    func updatePlaceSolary(id: ObjectIdentifier){
        let request = NSFetchRequest<Place>(entityName: "Place")
        do{
            places = try manager.context.fetch(request)
            let place = places.first(where: {$0.id == id})
            place?.salary = Int16(simplePlaceSolary) ?? 0
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        
        save()
        
    }
    
    //MARK: - addNewWorkerCell
    func addNewWorkerCell(){
        simpleWorkers.append(simpleWorkerName)
        simpleWorkersImages.append(simpleWorkerImage)
        countWorkers += 1
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
    
    //MARK: - Add all worker
    func addAllWorkers(place: Place){
        var index = 0
        for simpleWorker in simpleWorkers {
            if !simpleWorker.isEmpty{
                addWorker(workerName: simpleWorker, workerImage: simpleWorkersImages[index], place: place)
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
    
    //MARK: - Add one worker
    func addWorker(workerName: String, workerImage: UIImage, place: Place){
        let newWorker = Worker(context: manager.context)
        newWorker.nameWorker = workerName
        newWorker.photoWorker = workerImage
        newWorker.place = place
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
    
    func getWorkers(){
        let request = NSFetchRequest<Worker>(entityName: "Worker")
        
        do{
            workers = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear property
    func clear(){
        simplePlaceTitle = ""
        simpleAdress = ""
        simplePlaceSolary = ""
        
        simpleCarTitle = ""
        simpleCarImage = ImageResource.car1
        simpleCars.removeAll()
        simpleCarImageArray.removeAll()
        countCars = 0
        
        simpleWorkerName = ""
        simpleWorkerImage = .test
        simpleWorkers.removeAll()
        simpleWorkersImages.removeAll()
        countWorkers = 0
        
        
    }
    
    //MARK: - Save data
    func save(){
        places.removeAll()
        manager.save()
        getPlace()
        getCars()
        getWorkers()
    }
}
