//
//  findRoomViewController.swift
//  RoomPlan
//
//  Created by Haroon on 3/21/20.
//  Copyright © 2020 Haroon. All rights reserved.
//

import UIKit

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
    }
}
