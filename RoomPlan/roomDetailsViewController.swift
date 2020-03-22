//
//  roomDetailsViewController.swift
//  RoomPlan
//
//  Created by Haroon on 3/21/20.
//  Copyright © 2020 Haroon. All rights reserved.
//

import UIKit
import Parse
class roomDetailsViewController: UIViewController {

    @IBOutlet weak var roomName: UITextField!
    
    @IBOutlet weak var roomUser: UITextField!
    
    @IBOutlet weak var roomID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addUser(_ sender: Any) {
        }
        
    @IBAction func createRoom(_ sender: Any) {
        let room = PFObject(className: "Rooms")
        var users : [PFUser] = []
        var currentUser = PFUser.current()
        room["name"] = roomName.text
        room["users"] = users
    
        room.saveInBackground { (success, error) in
            if success{
            NSLog("Object created with id: \(room.objectId)")
                currentUser?["room"] = room.objectId
                print(room.objectId)
                currentUser?.saveInBackground(block: { (success, error) in
                    print("hm")
                })
                print("yay")
            } else{
                print("error!")
            }
}
    


}

}
