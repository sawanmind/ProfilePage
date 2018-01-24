//
//  ProfileModel.swift
//  Profile Page
//
//  Created by iOS Developer on 1/24/18.
//  Copyright © 2018 Genysis. All rights reserved.
//

import UIKit



struct ProfileModel {
    
    var icon : UIImage?
    var title : NSAttributedString?
    var isSelected: Bool?
 
    
    init(icon:UIImage, title:NSAttributedString, isSelected:Bool = false) {
        self.icon = icon
        self.title = title
        self.isSelected = isSelected
    }
}
