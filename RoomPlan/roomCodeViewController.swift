//
//  roomCodeViewController.swift
//  RoomPlan
//
//  Created by Haroon on 3/22/20.
//  Copyright © 2020 Haroon. All rights reserved.
//

import UIKit
import Parse
class roomCodeViewController: UIViewController {

    

    @IBOutlet weak var roomCode: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let roomNum = PFUser.current()?["room"]
        roomCode.text = roomNum as? String
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func nextScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "signupHomeSegue", sender: nil)
    }
}
