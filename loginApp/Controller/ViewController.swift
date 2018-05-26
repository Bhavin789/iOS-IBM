//
//  ViewController.swift
//  loginApp
//
//  Created by Bhavin on 17/12/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import GoogleSignIn
import Google
import AssistantV1

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var appUser : User?
    
    lazy var  logoImage: UIImageView = {
        
        let profileImage = UIImageView()
        
        profileImage.image = UIImage(named: "watson_avatar")
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.contentMode = .scaleAspectFill
        return profileImage
        
    }()
    
    let googleButton: UIButton = {
        let button = UIButton(type: .system)
        //button.backgroundColor = UIColor(red: 228/255, green: 102/255, blue: 102/255, alpha: 1)
        button.backgroundColor = UIColor(red: 219/255, green: 50/255, blue: 54/255, alpha: 1)
        button.setTitle("Google", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(type: .system)
        //button.backgroundColor = UIColor(red: 228/255, green: 102/255, blue: 102/255, alpha: 1)
        button.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleFacebook), for: .touchUpInside)
        return button
    }()
    
    let watsonLabel: UILabel = {
        let label = UILabel()
        label.text = "Watson"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var error: NSError?
        
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil{
            print(error ?? "some error")
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        //let googleButton = GIDSignInButton()
        view.addSubview(googleButton)
        view.addSubview(facebookButton)
        view.addSubview(watsonLabel)
        self.view.addSubview(logoImage)
        
        googleButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        googleButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        googleButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 8).isActive = true
        
        facebookButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        facebookButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        facebookButton.topAnchor.constraint(equalTo: watsonLabel.bottomAnchor, constant: 20).isActive = true
        
        watsonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        watsonLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 16).isActive = true
        watsonLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        watsonLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        checkCurrentUser()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleGoogleSignIn(){
        GIDSignIn.sharedInstance().signIn()
    }
    
    @objc func checkCurrentUser(){
        if GIDSignIn.sharedInstance().hasAuthInKeychain(){
            print("OK TO GO")
        }else{
            print("LOGIN FIRST")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print(error ?? "some error")
            return
        }
        
        print(user.profile.email)
        print(user.profile.givenName!)
        
        if let fname = user.profile.givenName, let lname = user.profile.familyName, let mail = user.profile.email{
            self.appUser = User(mail: mail, first_name: fname, last_name: lname, id:1 as? Int)
            /*let viewController = self.storyboard?.instantiateViewController(withIdentifier: "vc") as? DetailViewController
            //viewController.user = self.user
            
            viewController?.setUpUser(mail: self.appUser?.mail, first_name: self.appUser?.first_name, last_name: self.appUser?.last_name, id: self.appUser?.id)
            self.present(viewController!, animated: true, completion: nil)*/
            
            DispatchQueue.main.async {
                let viewController = MenuViewController()
                viewController.user = self.appUser!
                let navigationController = UINavigationController(rootViewController: viewController)
                self.present(navigationController, animated: true, completion: nil)
            }
        }
    }

    @objc func handleFacebook(){
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self) { (result) in
            switch result {
            case .failed(let error):
                print(error.localizedDescription)
            case .cancelled:
                print("user cancelled")
            case .success(_,_,_):
                self.getUserInfo(completion: { (userInfo, err) in
                    if let error = err{
                        print(error.localizedDescription)
                    }
                    
                    print(userInfo!)
                    
                    if let userInfo = userInfo, let firstName = userInfo["first_name"], let lastName = userInfo["last_name"], let mailId = userInfo["email"], let id = userInfo["id"]{
                        self.appUser = User(mail: mailId as? String, first_name: firstName as? String, last_name: lastName as? String, id: id as? Int)
                        print("reached")
                        
                        DispatchQueue.main.async {
                            let viewController = MenuViewController()
                            viewController.user = self.appUser!
                            let navigationController = UINavigationController(rootViewController: viewController)
                            self.present(navigationController, animated: true, completion: nil)
                        }
                        
                        /*DispatchQueue.main.async {
                            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "vc") as? DetailViewController
                            //viewController.user = self.user
                            
                            viewController?.setUpUser(mail: self.appUser?.mail, first_name: self.appUser?.first_name, last_name: self.appUser?.last_name, id: self.appUser?.id)
                            self.present(viewController!, animated: true, completion: nil)
                        }*/
                        
                    }
                    
                    
                    
                })
        }
    }
    }
    
    func getUserInfo(completion: @escaping (_ : [String: Any]?, _ : Error?) -> Void){
        let parameters = ["fields" : "id, email, first_name, last_name"]
        let result = GraphRequest(graphPath: "me", parameters: parameters)
        result.start { (response, result) in
            switch result{
            case .failed(let error):
                print(error.localizedDescription)
                completion(nil, error)
            case .success(response: let graphResponse):
                completion(graphResponse.dictionaryValue, nil)
            }
            
        }
    }
}

