//
//  PersonalityViewController.swift
//  loginApp
//
//  Created by Bhavin on 22/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit
import PersonalityInsightsV3
import SwiftyJSON
import NaturalLanguageUnderstandingV1

class PersonalityViewController: UIViewController, UITextViewDelegate {
    
    var heading: String!
    
    
    var textView: UITextView = {
        let view = UITextView()
        var borderColor = UIColor(displayP3Red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1.0
        view.layer.borderColor = borderColor.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let analyzeButton: UIButton = {
        let button = UIButton(type: .system)
        //button.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
        button.backgroundColor = UIColor.black
        button.setTitle("Analyze", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleAnalyze), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        
        view.addSubview(textView)
        view.addSubview(analyzeButton)
        
        textView.delegate = self
        
        self.navigationItem.title = heading
        
        textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        analyzeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        analyzeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        analyzeButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        analyzeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleAnalyze(){
        print("analyze")
        
        
        
        let words = textView.text.components(separatedBy: .whitespacesAndNewlines)
        let filteredWords = words.filter({ (word) -> Bool in
            word != ""
        })
        let wordCount = filteredWords.count
        
        print(wordCount)
        
        if(heading == "Personality Insights"){
        if(wordCount > 100){
            let personalityInsights = PersonalityInsights(username: Credentials.PersonalityUsername, password: Credentials.PersonalityPassword, version: Credentials.version)
            
            let failure = { (error: Error) in print(error) }
            personalityInsights.profile(text: textView.text, failure: failure) { profile in
                print(profile)
                let viewController = PersonalityResultsViewController()
                viewController.emotionalPercentile = profile.personality[4].percentile
                viewController.curiosityPercentile = profile.needs[2].percentile
                viewController.oppenness_to_changePercentile = profile.values[1].percentile
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }else{
            print("NO")
            let viewController = PersonalityResultsViewController()
            viewController.emotionalPercentile = 1.0
            viewController.curiosityPercentile = 2.0
            viewController.oppenness_to_changePercentile = 3.0
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        }else{
            let naturalLanguageUnderstanding = NaturalLanguageUnderstanding(username: Credentials.NLPUsername, password: Credentials.NLPPassword, version: Credentials.version)
            
            let features = Features(concepts: ConceptsOptions(limit: 5))
            let parameters = Parameters(features: features, text: textView.text)
            
            let failure = {(error: Error) in print(error)}
            naturalLanguageUnderstanding.analyze(parameters: parameters, failure: failure, success: { (results) in
                print(results)
                DispatchQueue.main.async {
                    let viewController = NLPResultsViewController()
                    if let sentimentLabel = results.sentiment?.document?.label{
                        viewController.emotion = sentimentLabel
                    }else{
                        viewController.emotion = "SAD"
                    }
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            })
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
