//
//  UIViewExtension.swift
//  TopicsList
//
//  Created by Patrick on 4/14/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import UIKit

extension UIView
{
    func makeCircular() {
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }
    
    func roundCorners()
    {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
