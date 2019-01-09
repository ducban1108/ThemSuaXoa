//
//  TableViewController.swift
//  ThemSuaXoa
//
//  Created by Duc on 08/01/2019.
//  Copyright © 2019 Duc. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var arrayString = ["Sieu Nhan", "Sieu Trom", "Sieu Dien"]
    var newString: String = ""


    @IBOutlet var noData: UIView!
    @IBOutlet weak var footerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        tableView.backgroundView = noData
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if arrayString.count != 0 {
            tableView.tableHeaderView = footerView
        }
        else {
            tableView.tableHeaderView = noData
        }
        tableView.reloadData()
    }



    // MARK: - Table view data source


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayString.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arrayString[indexPath.row]

        return cell
    }
    @IBAction func done(segue: UIStoryboardSegue) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let dataDetailVC = segue.source as! ViewController
            arrayString[indexPath.row] = dataDetailVC.data!
        } else{
            let dataDetailVC = segue.source as! ViewController
            newString = dataDetailVC.data!
            arrayString.append(newString)
        }
        if arrayString.count != 0 {
            tableView.tableHeaderView = footerView
        }
        else {
            tableView.tableHeaderView = noData
        }
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            if let bucket = segue.destination as? ViewController {
                bucket.data = arrayString[indexPath.row]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            arrayString.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)

        }
        if arrayString.count == 0 {
            tableView.tableHeaderView = noData
        }
        else {
            tableView.tableHeaderView = footerView
        }
        tableView.reloadData()

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
