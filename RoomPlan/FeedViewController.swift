//
//  FeedViewController.swift
//  RoomPlan
//
//  Created by Haroon on 3/21/20.
//  Copyright © 2020 Haroon. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var chores = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Chores")
        query.includeKey("owner")
        query.limit = 20
        
        query.findObjectsInBackground { (chores, error) in
            if chores != nil{
                self.chores = chores!
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoreCell") as! ChoreCell
        
        let chore = chores[indexPath.row]
        
        let user = chore["owner"] as! PFUser
        
        cell.choreLabel.text = chore["name"] as! String
        cell.userLabel.text = user.username as! String
        cell.dateLabel.text = chore["date"] as! String
        cell.descLabel.text = chore["description"] as! String
        
        let imageFile = chore["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af_setImage(withURL: url)
        
        
        
        return cell
    }
    
    
    
    @IBAction func onCreate(_ sender: Any) {
                        self.performSegue(withIdentifier: "createChoreSegue", sender: nil)
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
