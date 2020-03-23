//
//  CreateChoreViewController.swift
//  RoomPlan
//
//  Created by Haroon on 3/22/20.
//  Copyright © 2020 Haroon. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class CreateChoreViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descText: UITextView!
    private var datePicker: UIDatePicker?
    
    @IBOutlet weak var imageView: UIImageView!
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
    
    
    @IBAction func onCameraButoon(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func onSubmit(_ sender: Any) {
        let chore = PFObject(className: "Chores")
        
        chore["name"] = nameField.text
        chore["owner"] = PFUser.current()!
        chore["date"] = dateField.text
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        chore["image"] = file
        
        chore.saveInBackground { (success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
            }
        }
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
    
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
