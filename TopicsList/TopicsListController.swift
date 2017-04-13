//
//  ViewController.swift
//  TopicsList
//
//  Created by Patrick on 4/13/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import UIKit

class TopicsListController: UITableViewController {
    
    let addTopicButton : UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "Add Topic", style: .plain, target: self, action: #selector(addTopic))
        return btn
    }()

    
    func addTopic()
    {
        //TODO: launch new topic screen here
        print("add topic")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.rightBarButtonItem = addTopicButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell") as? TopicCell
        {
            cell.populateData()
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}

