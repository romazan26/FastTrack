//
//  Worker+CoreDataProperties.swift
//
//
//  Created by Роман on 29.07.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Worker)
public class Worker: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Worker> {
        return NSFetchRequest<Worker>(entityName: "Worker")
    }

    @NSManaged public var nameWorker: String?
    @NSManaged public var photoWorker: UIImage?
    @NSManaged public var place: Place?

}

extension Worker : Identifiable {

}
