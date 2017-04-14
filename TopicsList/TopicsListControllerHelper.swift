//
//  TopicsListControllerHelper.swift
//  TopicsList
//
//  Created by Patrick on 4/14/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation

extension TopicsListController
{
    //create mock data to populate table
    func setupMockData()
    {
        for i in 0...25
        {
            let dummyTopic = Topic()
            dummyTopic.downvotes = 10
            dummyTopic.upvotes = 15
            dummyTopic.topicText = "This is a test topic \(i)"
            dummyTopic.username = "user\(i)"
            self.topics.append(dummyTopic)
        }
        self.tableView.reloadData()
    }

    
}
