//
//  TableViewController.swift
//  Challenge
//
//  Created by Sahar Hany on 7/23/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController ,ParentProtocol{

    var dataSource        : [String]?
    var firstNameList     : [String]?
    var lastNameList      : [String]?
    var selectedIndexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        selectedIndexPath = nil
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    func loadData(){
        dataSource    =  ["One", "Two", "Three"]
        firstNameList =  ["Sahar", "Aya", "Ghadeer"]
        lastNameList  =  ["Hany", "Hamdy", "Ashraf"]

    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = dataSource?[indexPath.row] ?? "\(indexPath.row)"

        if (selectedIndexPath != nil) && (selectedIndexPath?.row == indexPath.row){
            cell.backgroundColor       = UIColor.white
            cell.textLabel?.textColor  = UIColor.purple
            selectedIndexPath = nil
        }else{
            cell.backgroundColor       = UIColor.purple
            cell.textLabel?.textColor  = UIColor.white
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//          let alert = UIAlertController.init(title: "Numbers App", message: dataSource?[indexPath.row] ?? "\(indexPath.row)", preferredStyle: .alert)
//          alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
//          present(alert, animated: true, completion: nil)
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "showDetails", sender: nil)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if var destinationVC = segue.destination as? ChildProtocol {
            destinationVC.vc  = self
            destinationVC.setData(firstName: firstNameList![selectedIndexPath!.row], lastName: lastNameList![selectedIndexPath!.row])
        }
    }
    
    func highlightCellAtIndexPath(){
        if selectedIndexPath != nil {
            tableView.reloadData()
        }
    }
    
}
