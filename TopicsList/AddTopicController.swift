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
        
        //create gesture recognizer to detect taps on main view
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapOutside(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        topicTextfield.delegate = self
        usernameTextfield.delegate = self
    }
    
    //if tap on main view, dismiss keyboard
    func tapOutside(_ recognizer: UIGestureRecognizer)
    {
        view.endEditing(true)
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
        if let topicText = topicTextfield.text, let username = usernameTextfield.text, let delegate = delegate
        {
            let topic = Topic()
            topic.topicText = topicText
            topic.username = username
            
            //if valid topic and username, add to data source and go back to Topics List controller
            if topicText.characters.count > 0 && username.characters.count > 0
            {
                delegate.addTopic(topic: topic)
                navigationController?.popViewController(animated: true)
            }
            //if not valid, show alert view
            else
            {
                let alert = UIAlertController(title: "Invalid", message: "Please enter a valid topic and username", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }

}
