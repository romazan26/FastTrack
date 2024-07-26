//
//  PlaceViewModel.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import Foundation
import CoreData

final class PlaceViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var isPresentNewPlace = false
    
    @Published var places: [Place] = []
    
    @Published var simplePlaceTitle = ""
    @Published var simpleAdress = ""
    
    //MARK: - Add Place
    func addPlace(){
        let newPlace = Place(context: manager.context)
        newPlace.placetitle = simplePlaceTitle
        newPlace.adress = simpleAdress
        
        save()
        clear()
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
    
    //MARK: - Clear property
    func clear(){
        simplePlaceTitle = ""
        simpleAdress = ""
    }
    
    //MARK: - Save data
    func save(){
        places.removeAll()
        manager.save()
        getPlace()
    }
}
