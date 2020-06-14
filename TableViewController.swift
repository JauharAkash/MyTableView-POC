// Akash Jauhar
// Lab 4 - Part 2
//
//  TableViewController.swift
//  MyTableView
//
//  Created by Akash Jauhar on 4/1/20.
//  Copyright © 2020 Akash Jauhar. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var menuItems = HardwareItems()
    
    // Selecting Function, can only select one row at a time
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Set the number of rows that are needed for the table row
    override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection: Int)->Int{
        return menuItems.names.count
    }
    
    // The final view of the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
            
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                       for: indexPath)
    
    let row = indexPath.row
              
    cell.textLabel?.text = menuItems.names[row]
        
        //price rounded to 2 decimal spaces
    let price = String(format:"%2.2f", menuItems.prices[row])
            
    cell.detailTextLabel?.text = price
            
    if menuItems.specials[row]{
            // All the specials are colored in cyan
                cell.backgroundColor = UIColor.cyan
            } else {
        // non-specials are colored in white
                cell.backgroundColor = UIColor.white
         }
     
     return cell
    }
    
    //Extra Credit - Challenge
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert_box = UIAlertController(title: menuItems.names[indexPath.row], message: String(format: "%2.2f", menuItems.prices[indexPath.row]), preferredStyle: .alert )
        alert_box.addAction(UIAlertAction(title:"Continue", style: .default, handler: nil))
        self.present(alert_box, animated:true, completion: nil)
    }
    
 
}

