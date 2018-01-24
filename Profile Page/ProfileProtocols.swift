//
//  Protocols.swift
//  Profile Page
//
//  Created by iOS Developer on 1/24/18.
//  Copyright © 2018 Genysis. All rights reserved.
//

import UIKit


protocol ProfileDelegate {
    func didTapOnCell<T>(cell:T, type:ImageType)
}
