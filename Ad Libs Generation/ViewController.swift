//
//  ViewController.swift
//  Ad Libs Generation
//
//  Created by Shane Doyle on 11/12/2016.
//  Copyright © 2016 Shane Doyle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var textFields: [UITextField]!

    @IBOutlet weak var pastTenseVerbTextField: UITextField!
    @IBOutlet weak var singularNounTextField: UITextField!
    @IBOutlet weak var pluralNounTextField: UITextField!
    @IBOutlet weak var phraseTextField: UITextField!
    @IBOutlet weak var locationSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var createLibsPressed: UIButton!
    @IBOutlet weak var finishSentenceTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields = [pastTenseVerbTextField, singularNounTextField, pluralNounTextField, phraseTextField]
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var location = ""
        
        location = "\(locationSegmentedControl.titleForSegment(at: locationSegmentedControl.selectedSegmentIndex)!)"
        
        finishSentenceTextView.text = "One evening at the \(location) a \(singularNounTextField.text!) \(pastTenseVerbTextField.text!) \(sliderLabel.text!) \(pluralNounTextField.text!) and said, \(phraseTextField.text!)"
        finishSentenceTextView.backgroundColor = UIColor.yellow
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderLabel.text = "\(Int(numberSlider.value))"
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let arrayOfTextFields = textFields as NSArray
        let arrayIndex = arrayOfTextFields.index(of: textField)
        
        print(arrayIndex)
        
        if arrayIndex < arrayOfTextFields.count - 1 {
            let newTextField = arrayOfTextFields[arrayIndex + 1] as! UITextField; newTextField.becomeFirstResponder()
            let doneTextField = arrayOfTextFields[arrayIndex] as! UITextField; doneTextField.backgroundColor = UIColor.yellow
        } else {
            textField.resignFirstResponder()
            textField.backgroundColor = UIColor.yellow
        }
        
        return true
    }
}

