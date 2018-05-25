//
//  NLPResultsViewController.swift
//  loginApp
//
//  Created by Bhavin on 23/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit

class NLPResultsViewController: UIViewController {
    
    var emotion: String!
    
    var alert: UIAlertController!
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR TEXT HAS SENTIMENT"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    let emotionLabel: UILabel = {
        let label = UILabel()
        label.text = "SAD"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.black
        view.addSubview(nameLabel)
        view.addSubview(emotionLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        emotionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        emotionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        emotionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        emotionLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        emotionLabel.text = emotion
        // Do any additional setup after loading the view.
    }
    
    func textFieldHandler(textField: UITextField!) -> Void{
        if (textField) != nil {
            textField.placeholder = "Enter feedback here"
        }
    }
    
    func showAlert(_ msg: String){
        alert = UIAlertController(title: "Language Understanding", message: msg, preferredStyle: .alert)
        alert.addTextField(configurationHandler: textFieldHandler)
        alert.addAction(UIAlertAction(title: "SUBMIT", style: .default, handler: handleFeedback))
        alert.addAction(UIAlertAction(title: "NO FEEDBACK", style: .default, handler: { (action) in
            print(self.alert.textFields![0].text)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func handleFeedback(action: UIAlertAction){
        print("f")
    }
    
    @objc func handleCancel(action: UIAlertAction){
        self.navigationController?.popViewController(animated: true)
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
