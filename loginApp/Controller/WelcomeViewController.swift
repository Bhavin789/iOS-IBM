//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by Bhavin on 17/12/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var user: User!
    var firstName: String!
    var lastName: String!
    
    let nameLabel:  UILabel = {
        
        let label = UILabel()
        //label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(nameLabel)

        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://thermoelectrical-la.000webhostapp.com/service.php")! as URL)
        request.httpMethod = "POST"
        
        if let user = user, let fname = user.first_name, let lname = user.last_name, let mail = user.mail{
            
            
            let postString = "a=\(mail)"
            print(postString)
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
                if error != nil{
                    print(error)
                }
                
                print("res = \(String(describing: response))")
                let responseString = NSString(data: (data)!, encoding: String.Encoding.utf8.rawValue)
                print("response from welcome ********** = \(String(describing: responseString))")
                
                let json = try! JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]]
                
                for userData in json!{
                    
                    if let firstName = userData["first_name"] as? String{
                        print(firstName)
                        
                        DispatchQueue.main.async{
                          self.nameLabel.text = firstName
                        }
                        //self.nameLabel.text = firstName
                    }
                    
                    if let lastName = userData["last_name"] as? String{
                        print(lastName)
                        self.lastName = lastName
                    }
                    
                }
                
            }
            task.resume()
        }
        
        
        
        // Do any additional setup after loading the view.
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
