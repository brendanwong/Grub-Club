//
//  UserTableViewController.swift
//  Grub Club v3
//
//  Created by Nathan Chang on 9/30/17.
//  Copyright © 2017 Nathan Chang. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    //holds all the users
    var users = [User]()
    
    //holds number of users invited
    var num_invited = 0
    
    //MARK: Properties
    @IBAction func userInvited(_ sender: UISwitch) {
        if num_invited == 5 {
            return
        }
        
        //once you invite everyone, you'll constantly keep inviting 4 or 5.
        //I couldn't figure out how to use the isOn function to prevent this
        num_invited += 1
        print("this many invited")
        print(num_invited)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        //this table only has 1 section ie. column
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //this table only has as many rows as users
        
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "UserTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserTableViewCell else {
            fatalError("The dequeued cell is not an instance of UserTableViewCell.")
        }
        
        
        // Fetches the appropriate meal for the data source layout.
        let user = users[indexPath.row]
        
        cell.nameUser.text = user.name
        cell.imageUser.image = user.photo

        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadSampleUsers() {
        
        //holds each user's photos
        let p_rick = UIImage(named: "Rick")
        let p_morty = UIImage(named: "Morty")
        let p_summer = UIImage(named: "Summer")
        let p_beth = UIImage(named: "Beth")
        let p_jerry = UIImage(named: "Jerry")
        
        guard let rick = User(name: "Rick Sanchez", photo: p_rick) else {
            fatalError("Unable to instantiate rick")
        }
        guard let morty = User(name: "Morty Smith", photo: p_morty) else {
            fatalError("Unable to instantiate morty")
        }
        guard let summer = User(name: "Summer Smith", photo: p_summer) else {
            fatalError("Unable to instantiate summer")
        }
        guard let beth = User(name: "Beth Smith", photo: p_beth) else {
            fatalError("Unable to instantiate beth")
        }
        guard let jerry = User(name: "Jerry Smith", photo: p_jerry) else {
            fatalError("Unable to instantiate jerry")
        }

        //fills up user array with sample users by default
        users += [rick, morty, summer, beth, jerry]
        
        
    }

}
