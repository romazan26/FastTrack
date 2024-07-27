//
//  Car+CoreDataProperties.swift
//
//
//  Created by Роман on 27.07.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit


@objc(Car)
public class Car: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var carImage: UIImage?
    @NSManaged public var carTitle: String?

}

extension Car : Identifiable {

}
