//
//  Topic.swift
//  TopicsList
//
//  Created by Patrick on 4/14/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation

class Topic
{
    var topicText = ""
    var username = ""
    private(set) var count: Int = 0
    
    var upvotes: Int = 0
    {
        didSet
        {
            recount()
        }
    }
    var downvotes: Int = 0
    {
        didSet
        {
            recount()
        }
    }
    
    func recount()
    {
        count = upvotes - downvotes
    }
}
