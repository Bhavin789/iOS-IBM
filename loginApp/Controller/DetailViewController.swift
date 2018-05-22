//
//  DetailViewController.swift
//  loginApp
//
//  Created by Bhavin on 17/12/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    var user: User!
    
    let lastNameLabel:  UILabel = {
    
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstNameLabel:  UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mailLabel:  UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let designationTextField: UITextField = {
        let txtField = UITextField()
        
        txtField.placeholder = "Enter designation"
       // txtField.textColor = UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1)
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
    }()
    
    let completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 249/255, green: 108/255, blue: 59/255, alpha: 1)
        button.setTitle("Complete Profile", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    
        button.addTarget(self, action: #selector(handleDatabase), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lastNameLabel)
        view.addSubview(firstNameLabel)
        view.addSubview(mailLabel)
        view.addSubview(designationTextField)
        view.addSubview(completeButton)
        
        designationTextField.delegate = self
        
        firstNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        firstNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        firstNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        lastNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        lastNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        lastNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 8).isActive = true
        
        mailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        mailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        mailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mailLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 8).isActive = true
        
        designationTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        designationTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        designationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        designationTextField.topAnchor.constraint(equalTo: mailLabel.bottomAnchor, constant: 8).isActive = true
        
        completeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        completeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        completeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        completeButton.topAnchor.constraint(equalTo: designationTextField.bottomAnchor, constant: 8).isActive = true
        
        print("Calling view did load")
        
        firstNameLabel.text = user.first_name
        lastNameLabel.text = user.last_name
        mailLabel.text = user.mail
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUser(mail: String?, first_name: String?, last_name: String?, id: Int?){
        print("Setting up user")
        user = User(mail: mail, first_name: first_name, last_name: last_name, id: id)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    @objc func handleDatabase(){
        print("hi")
        let request = NSMutableURLRequest(url: NSURL(string: "https://thermoelectrical-la.000webhostapp.com/store.php")! as URL)
        request.httpMethod = "POST"
        
        if let user = user, let fname = user.first_name, let lname = user.last_name, let mail = user.mail, let designation = designationTextField.text{
            
            let postString = "a=\(user.id)&b=\(fname)&c=\(lname)&d=\(mail)&e=\(designation)"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
                if error != nil{
                    print(error)
                }
                
                print("res = \(String(describing: response))")
                let responseString = NSString(data: (data)!, encoding: String.Encoding.utf8.rawValue)
                print("response = \(String(describing: responseString))")
            }
            task.resume()
        }
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "vc2") as? WelcomeViewController
        //viewController.user = self.user
        
        viewController?.user = self.user
        self.present(viewController!, animated: true, completion: nil)
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
