//
//  TranslatorResultsViewController.swift
//  loginApp
//
//  Created by Bhavin on 25/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit

class TranslatorResultsViewController: UIViewController {
    
    var text: String!
    var language: String!
    
    var alert: UIAlertController!
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.text = "YOUR TEXT HAS SENTIMENT"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleClose))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        
        
        view.addSubview(nameLabel)
        
        self.navigationItem.title = "TRANSLATED TEXT"
        
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        nameLabel.text = text

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
        alert = UIAlertController(title: "Translator", message: msg, preferredStyle: .alert)
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
            Log.saveObject(title: "Language Translator", feedback: "", keywords: "\(self.language!)", time: date)
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func handleFeedback(action: UIAlertAction){
        
        let date = Date()
        Log.saveObject(title: "Language Translator", feedback: alert.textFields![0].text!, keywords: "\(language!)", time: date)
        
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
