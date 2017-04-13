//
//  TopicsListDelegate.swift
//  TopicsList
//
//  Created by Patrick on 4/14/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation

protocol TopicListDelegate
{
    func addTopic(topic: Topic)
    func topicUpvoted()
    func topicDownvoted()
}
