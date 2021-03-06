//
//  PersonalityResultsViewController.swift
//  loginApp
//
//  Created by Bhavin on 22/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit
import PersonalityInsightsV3

class PersonalityResultsViewController: UIViewController {
    
    var emotionalPercentile: Double!
    var curiosityPercentile: Double!
    var oppenness_to_changePercentile: Double!
    
    var textField: UITextField!
    var alert: UIAlertController!
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "PERSONALITY"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let nameSeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let namePerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let needsLabel: UILabel = {
        let label = UILabel()
        label.text = "CONSUMER NEEDS"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let needsSeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let needsPerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let valuesLabel: UILabel = {
        let label = UILabel()
        label.text = "VALUES"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let valuesSeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let valuesPerLabel: UILabel = {
        let label = UILabel()
        label.text = "vfvfvf"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(nameLabel)
        view.addSubview(nameSeparator)
        view.addSubview(namePerLabel)
        view.addSubview(needsLabel)
        view.addSubview(needsSeparator)
        view.addSubview(needsPerLabel)
        view.addSubview(valuesLabel)
        view.addSubview(valuesSeparator)
        view.addSubview(valuesPerLabel)
        //view.addSubview(okButton)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleClose))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameSeparator.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        nameSeparator.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        nameSeparator.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        namePerLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        namePerLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        namePerLabel.topAnchor.constraint(equalTo: nameSeparator.bottomAnchor, constant: 8).isActive = true
        namePerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        needsLabel.topAnchor.constraint(equalTo: namePerLabel.bottomAnchor, constant: 10).isActive = true
        needsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        needsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        needsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        needsSeparator.topAnchor.constraint(equalTo: needsLabel.bottomAnchor, constant: 3).isActive = true
        needsSeparator.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        needsSeparator.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        needsSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        needsPerLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        needsPerLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        needsPerLabel.topAnchor.constraint(equalTo: needsSeparator.bottomAnchor, constant: 8).isActive = true
        needsPerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        valuesLabel.topAnchor.constraint(equalTo: needsPerLabel.bottomAnchor, constant: 10).isActive = true
        valuesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        valuesLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        valuesLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        valuesSeparator.topAnchor.constraint(equalTo: valuesLabel.bottomAnchor, constant: 5).isActive = true
        valuesSeparator.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        valuesSeparator.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        valuesSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        valuesPerLabel.leftAnchor.constraint(equalTo: valuesLabel.leftAnchor, constant: 0).isActive = true
        valuesPerLabel.rightAnchor.constraint(equalTo: valuesLabel.rightAnchor).isActive = true
        valuesPerLabel.topAnchor.constraint(equalTo: valuesSeparator.bottomAnchor, constant: 8).isActive = true
        valuesPerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        namePerLabel.text = "Emotional = \(emotionalPercentile!)"
        needsPerLabel.text = "Curiosity = \(curiosityPercentile!)"
        valuesPerLabel.text = "Openness to Change = \(oppenness_to_changePercentile!)"
        
        // Do any additional setup after loading the view.
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
        alert = UIAlertController(title: "Personality", message: msg, preferredStyle: .alert)
        alert.addTextField(configurationHandler: textFieldHandler)
        alert.addAction(UIAlertAction(title: "SUBMIT", style: .default, handler: handleFeedback))
        alert.addAction(UIAlertAction(title: "NO FEEDBACK", style: .default, handler: { (action) in
            
            /*
            let date = NSDate()
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            var dateString = dateFormatter.string(from: date as Date)
            */
            let date = Date()
            Log.saveObject(title: "Personality Insights", feedback: "", keywords: "emotional curiosity change", time: date)
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func handleFeedback(action: UIAlertAction){
        
        let date = Date()
        Log.saveObject(title: "Personality Insights", feedback: alert.textFields![0].text!, keywords: "emotional curiosity change", time: date)
        
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
