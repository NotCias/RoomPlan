//
//  findRoomViewController.swift
//  RoomPlan
//
//  Created by Haroon on 3/21/20.
//  Copyright © 2020 Haroon. All rights reserved.
//

import UIKit
import Parse
class findRoomViewController: UIViewController {

    @IBOutlet weak var roomCode: UITextField!
    
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

    @IBAction func createRoom(_ sender: Any) {
        performSegue(withIdentifier: "roomDetailsSegue", sender: nil)
    }
    @IBAction func joinRoom(_ sender: Any) {
        let currentUser = PFUser.current()!
        var listo : [PFUser] = []
        listo.append(currentUser)
        let query = PFQuery(className:"Rooms")
        query.getObjectInBackground(withId: roomCode.text!) { (room, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let room = room {
                    room.addUniqueObjects(from: listo, forKey:"users")
                    room.saveInBackground { (success, error) in
                        if success{
                            print("yep")
                            self.performSegue(withIdentifier: "findRoomSegue", sender: nil)
                        }else{
                            print("nope")
                        }
                    }

                }
            }
    }
}
