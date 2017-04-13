//
//  ViewController.swift
//  TopicsList
//
//  Created by Patrick on 4/13/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import UIKit

class TopicsListController: UITableViewController {
    
    
    var topics: [Topic]?
    
    //create Add Topic navigation button programatically
    lazy var addTopicButton : UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "Add Topic", style: .plain, target: self, action: #selector(self.addTopic))
        return btn
    }()
    
    //MOCK DATA
    func setupMockData()
    {
        let dummyTopic = Topic()
        dummyTopic.downvotes = 10
        dummyTopic.upvotes = 22
        dummyTopic.topicText = "This is a topic"
        dummyTopic.username = "Patrick"
        topics?.append(dummyTopic)

        self.tableView.reloadData()
    }
    
    func addTopic()
    {
        //launch New Topic screen programatically
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addTopicController = storyboard.instantiateViewController(withIdentifier: "addTopicController")
        self.navigationController?.pushViewController(addTopicController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.rightBarButtonItem = addTopicButton
        
        topics = [Topic]()
        
        //create temporary mock data
        self.setupMockData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = topics?.count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicCell

        if let topic = topics?[indexPath.item]
        {
            cell.topic = topic
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}

