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
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(CreateChoreViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateChoreViewController.viewTapped(gestureRecognizer:)))
        
        dateField.inputView = datePicker
        
        

        // Do any additional setup after loading the view.
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
