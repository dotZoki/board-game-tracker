//
//  BoardGame.swift
//  BoardGameTracker
//
//  Created by Zoran Lazic on 08/12/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import Foundation
import UIKit

class BoardGame {
    
    var name: String
    var image: UIImage?
    var rented: String?
    
    init(name: String, image: UIImage?) {
        self.name = name
        self.image = image
    }
}