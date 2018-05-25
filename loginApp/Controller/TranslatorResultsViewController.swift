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
        view.addSubview(nameLabel)
        
        self.navigationItem.title = "TRANSLATED TEXT"
        
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        nameLabel.text = text

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
