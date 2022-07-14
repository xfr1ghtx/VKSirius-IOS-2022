//
//  CustomTableViewCellViewModel.swift
//  VKSirius
//
//  Created by developer on 14.07.2022.
//

import Foundation
import UIKit

final class CustomTableViewCellViewModel {
    
    public let name: String
    public let description: String
    public let link: String
    public let imageUrl: String
    
    init(name: String, description: String, link: String, imageUrl: String){
        self.name = name
        self.description = description
        self.link = link
        self.imageUrl = imageUrl
    }
    
    
}
