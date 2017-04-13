//
//  TopicCell.swift
//  TopicsList
//
//  Created by Charmaine on 4/13/17.
//  Copyright © 2017 Patrick. All rights reserved.
//

import Foundation
import UIKit

class TopicCell: UITableViewCell
{
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    
    func populateData()
    {
        print("populate data")
    }
    
}
