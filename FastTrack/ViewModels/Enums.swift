//
//  Enums.swift
//  FastTrack
//
//  Created by Роман on 27.07.2024.
//

import Foundation
import SwiftUI

enum Cars: CaseIterable, Identifiable {
    case car1
    case car2
    case car3
    case car4
    
    var image: ImageResource{
        switch self{
            
        case .car1:
            return .car1
        case .car2:
            return .car2
        case .car3:
            return .car3
        case .car4:
            return .car4
        }
    }
    
    var id: Self{
        self
    }
}
