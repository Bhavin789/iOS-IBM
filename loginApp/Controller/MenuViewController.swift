//
//  MenuViewController.swift
//  loginApp
//
//  Created by Bhavin on 22/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    var items = [String]()
    let cellId = "Workout"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "SELECT SERVICES"
        
        items = ["Discovery", "Natural Language Understanding","Personality Insights","Tone Analyzer","Watson Assistant", "Language Translator"]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "DASHBOARD", style: .plain, target: self, action: #selector(handleDashboard))
        self.navigationItem.leftBarButtonItem?.tintColor = .black

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(items[indexPath.row] == "Personality Insights"){
            
            let viewController = PersonalityViewController()
            viewController.heading = "Personality Insights"
            self.navigationController?.pushViewController(viewController, animated: true)
            
        }else if (items[indexPath.row] == "Natural Language Understanding"){
            
            let viewController = PersonalityViewController()
            viewController.heading = "Language Understanding"
            self.navigationController?.pushViewController(viewController, animated: true)
            
        }else if (items[indexPath.row] == "Tone Analyzer"){
            
            let viewController = PersonalityViewController()
            viewController.heading = "Tone Analyzer"
            self.navigationController?.pushViewController(viewController, animated: true)
            
        }else if (items[indexPath.row] == "Watson Assistant"){
            let viewController = AssistantViewController()
            viewController.heading = "Car Assistant"
            self.navigationController?.pushViewController(viewController, animated: true)
        } else if (items[indexPath.row] == "Language Translator"){
            let viewController = TranslatorInputViewController()
            viewController.heading = "Language Translator"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @objc func handleDashboard(){
        let viewController = DashboardViewController()
        self.present(viewController, animated: true, completion: nil)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
