//
//  ToneAnalyzerResultsTableViewController.swift
//  loginApp
//
//  Created by Bhavin on 23/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit
import ToneAnalyzerV3

class ToneAnalyzerResultsTableViewController: UITableViewController {
    
    private let cellId = "cellId"
    
    var alert: UIAlertController!
    
    var tones: [ToneScore]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "Tones Analyzed"
        self.tableView.separatorStyle = .none
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleClose))
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
        return tones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = tones[indexPath.row].toneName
        return cell
    }
    
    @objc func handleClose(){
        //self.dismiss(animated: true, completion: nil)
        showAlert("Any Feedback for the response")
        
    }
    
    func textFieldHandler(textField: UITextField!) -> Void{
        if (textField) != nil {
            textField.placeholder = "Enter feedback here"
        }
    }
    
    func showAlert(_ msg: String){
        alert = UIAlertController(title: "Tone Analyzer", message: msg, preferredStyle: .alert)
        alert.addTextField(configurationHandler: textFieldHandler)
        alert.addAction(UIAlertAction(title: "SUBMIT", style: .default, handler: handleFeedback))
        alert.addAction(UIAlertAction(title: "NO FEEDBACK", style: .default, handler: { (action) in
            
            /*
             let date = NSDate()
             
             */
            let date = Date()
            Log.saveObject(title: "Tone Analyzer", feedback: "", keywords: "\(self.tones[0].toneName)", time: date)
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            
        }))
        
    
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func handleFeedback(action: UIAlertAction){
        
        let date = Date()
        Log.saveObject(title: "Tone Analyzer", feedback: alert.textFields![0].text!, keywords: "\(tones[0].toneName)", time: date)
        
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
        
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
