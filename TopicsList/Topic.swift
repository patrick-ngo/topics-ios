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
    
    //count is the value used to determine the popularity of a post
    private(set) var count: Int = 0
    
    var upvotes: Int = 0
    {
        //after setting upvotes, automatically recalculate the count
        didSet
        {
            recount()
        }
    }
    var downvotes: Int = 0
    {
        //after setting downvotes, automatically recalculate the count
        didSet
        {
            recount()
        }
    }
    
    //recount by calculating differencing between upvotes and downvotes
    fileprivate func recount()
    {
        count = upvotes - downvotes
    }
}
