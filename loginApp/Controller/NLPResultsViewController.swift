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
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR TEXT HAS EMOTION"
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
