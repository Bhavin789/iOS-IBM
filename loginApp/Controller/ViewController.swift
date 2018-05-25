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

    @IBOutlet weak var facebookButton: UIButton!
    var appUser : User?
    
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
        
        let googleButton = GIDSignInButton()
        googleButton.center = view.center
        view.addSubview(googleButton)
        
        facebookButton.addTarget(self, action: #selector(handleFacebook), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                let viewController = DashboardViewController()
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
                            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "vc") as? DetailViewController
                            //viewController.user = self.user
                            
                            viewController?.setUpUser(mail: self.appUser?.mail, first_name: self.appUser?.first_name, last_name: self.appUser?.last_name, id: self.appUser?.id)
                            self.present(viewController!, animated: true, completion: nil)
                        }
                        
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

