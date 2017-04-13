//
//  AddTopicController.swift
//  TopicsList
//
//  Created by Patrick on 4/13/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import UIKit

class AddTopicController: UIViewController
{
    var delegate: TopicListDelegate?
    
    @IBOutlet weak var topicTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
    
    func submit()
    {
        if let delegate = delegate
        {
            let topic = Topic()
            
            if let topicText = topicTextfield.text
            {
                topic.topicText = topicText
            }
            
            if let username = usernameTextfield.text
            {
                topic.username = username
            }
            
            delegate.addTopic(topic: topic)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
