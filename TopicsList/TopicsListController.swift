//
//  ViewController.swift
//  TopicsList
//
//  Created by Patrick on 4/13/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import UIKit

class TopicsListController: UITableViewController, TopicListDelegate
{
    var topics: [Topic]?

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //create Add Topic navigation button programatically
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Topic", style: .plain, target: self, action: #selector(self.addTopicPressed))
        
        //create array
        self.topics = [Topic]()
        
        //create temporary mock data
//        self.setupMockData()
    }
    
    //create mock data to populate table
    func setupMockData()
    {
        for i in 0...25
        {
            let dummyTopic = Topic()
            dummyTopic.downvotes = 10
            dummyTopic.upvotes = 22
            dummyTopic.topicText = "This is a test topic \(i)"
            dummyTopic.username = "user\(i)"
            self.topics?.append(dummyTopic)
        }
        self.tableView.reloadData()
    }
    
    func addTopicPressed()
    {
        //launch New Topic screen programatically
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addTopicController = storyboard.instantiateViewController(withIdentifier: "addTopicController") as! AddTopicController
        addTopicController.delegate = self
        self.navigationController?.pushViewController(addTopicController, animated: true)
    }
    
    func addTopic(topic: Topic)
    {
        //add a topic and reload the table
        self.topics?.append(topic)
        self.tableView.reloadData()
    }
    
    func topicUpvoted()
    {
        //TODO: resort table here
        self.tableView.reloadData()
    }
    
    func topicDownvoted()
    {
        //TODO: resort table here
        self.tableView.reloadData()
    }
    
    //MARK: tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let count = topics?.count
        {
            //if less than 20 items, return all items
            if count <= 20
            {
                return count
            }
            //if more than 20 items, only show 20
            else
            {
                return 20
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //create cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicCell
        
        //set topic and delegate
        cell.topic = topics?[indexPath.item]
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 90
    }

}

