//
//  AddTopicController.swift
//  TopicsList
//
//  Created by Patrick on 4/13/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import UIKit

class AddTopicController: UIViewController, UITextFieldDelegate
{
    let CHAR_LIMIT = 255
    
    var delegate: TopicListDelegate?
    
    @IBOutlet weak var topicTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        
        topicTextfield.delegate = self
        usernameTextfield.delegate = self
    }
    
    //limit characters to 255
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let currentCharacterCount = textField.text?.characters.count ?? 0
        
        if (range.length + range.location > currentCharacterCount)
        {
            return false
        }
        
        let newLength = currentCharacterCount + string.characters.count - range.length
        return newLength <= CHAR_LIMIT
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
