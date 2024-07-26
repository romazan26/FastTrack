//
//  RegistrationViewModel.swift
//  FastTrack
//
//  Created by Роман on 24.07.2024.
//

import Foundation
import CoreData

final class RegistrationViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var users: [User] = []
    
    @Published var simpleName = ""
    @Published var simpleSurname = ""
    
    @Published var percents: Float = 0
    
    @Published var isPresentGame = false
    
    init(){
        getUser()
    }
    
    //MARK: - Add usesr
    func addUser(){
        let newUser = User(context: manager.context)
        newUser.name = simpleName
        newUser.serName = simpleSurname
        
        save()
        clear()
        
    }
    
    //MARK: - Get data
    func getUser(){
        let request = NSFetchRequest<User>(entityName: "User")
        
        do{
            users = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear property
    func clear(){
        simpleName = ""
        simpleSurname = ""
    }
    
    //MARK: - Save data
    func save(){
        users.removeAll()
        manager.save()
        getUser()
    }
}
