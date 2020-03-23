//
//  CreateChoreViewController.swift
//  RoomPlan
//
//  Created by Haroon on 3/22/20.
//  Copyright © 2020 Haroon. All rights reserved.
//

import UIKit

class CreateChoreViewController: UIViewController {

    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var descText: UITextView!
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descText.layer.borderWidth = 1
        descText.layer.borderColor = UIColor.lightGray.cgColor
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(CreateChoreViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateChoreViewController.viewTapped(gestureRecognizer:)))
        
        dateField.inputView = datePicker
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    func textViewDidBeginEditing(descText: UITextView) {
        if descText.textColor == UIColor.lightGray {
            descText.text = nil
            descText.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(descText: UITextView) {
        if descText.text.isEmpty {
            descText.text = "Enter description here"
            descText.textColor = UIColor.lightGray
        }
    }
    
    
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    
    @IBAction func homeScreen(_ sender: Any) {
                self.performSegue(withIdentifier: "createToHome", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
