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
import ToneAnalyzerV3

class PersonalityViewController: UIViewController, UITextViewDelegate {
    
    var heading: String!
    var alert: UIAlertController!
    
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
        if(wordCount > 1000){
            let personalityInsights = PersonalityInsights(username: Credentials.PersonalityUsername, password: Credentials.PersonalityPassword, version: Credentials.version)
            
            let failure = { (error: Error) in print(error) }
            personalityInsights.profile(text: textView.text, failure: failure) { profile in
                print(profile)
                
                let emotionPercentile = UserDefaults.standard.double(forKey: "emotionPercentile")
                let curiosityPercentile = UserDefaults.standard.double(forKey: "curiosityPercentile")
                let changePercentile = UserDefaults.standard.double(forKey: "changePercentile")
                
                UserDefaults.standard.set((profile.personality[4].percentile + emotionPercentile)/2, forKey: "emotionPercentile")
                UserDefaults.standard.set((profile.needs[2].percentile + curiosityPercentile)/2, forKey: "curiosityPercentile")
                UserDefaults.standard.set((profile.values[1].percentile + changePercentile)/2, forKey: "changePercentile")
                let viewController = PersonalityResultsViewController()
                viewController.emotionalPercentile = profile.personality[4].percentile
                viewController.curiosityPercentile = profile.needs[2].percentile
                viewController.oppenness_to_changePercentile = profile.values[1].percentile
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }else{
            showAlertMessage("Enter Atleast 1000 words to analyze")
        }
        }else if (heading == "Language Understanding"){
            let naturalLanguageUnderstanding = NaturalLanguageUnderstanding(username: Credentials.NLPUsername, password: Credentials.NLPPassword, version: Credentials.version)
            let feature = Features(concepts: ConceptsOptions(limit: 5),sentiment: SentimentOptions(document: true, targets: nil))
            
            let parameters = Parameters(features: feature, text: textView.text)
            
            let failure = {(error: Error) in print(error)}
            naturalLanguageUnderstanding.analyze(parameters: parameters, failure: failure, success: { (results) in
                print(results)
                DispatchQueue.main.async {
                    let viewController = NLPResultsViewController()
                    print(results.sentiment?.document?.label!)
                    if let sentimentLabel = results.sentiment?.document?.label{
                        print("++++++++++++")
                        print(sentimentLabel)
                        
                        let negativeEmotionsAnalyzed = UserDefaults.standard.integer(forKey: "negativeEmotionsAnalyzed")
                        let positiveEmotionAnalyzed = UserDefaults.standard.integer(forKey: "positiveEmotionAnalyzed")
                        
                        
                        if (sentimentLabel == "positive"){
                            UserDefaults.standard.set(positiveEmotionAnalyzed + 1, forKey: "positiveEmotionAnalyzed")
                        }else{
                            UserDefaults.standard.set(negativeEmotionsAnalyzed + 1, forKey: "negativeEmotionsAnalyzed")
                        }
                        viewController.emotion = sentimentLabel
                    }else{
                        viewController.emotion = "SAD"
                    }
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            })
            
        } else{
            let toneAnalyzer = ToneAnalyzer(username: Credentials.ToneAnalyzerUsername, password: Credentials.ToneAnalyzerPassword, version: Credentials.version)
            
            let toneInput = ToneInput(text: textView.text)
            let failure = {(error: Error) in print(error)}
            
            toneAnalyzer.tone(toneInput: toneInput, success: { (tones) in
                
                print(tones)
                
                let tonesAnalyzed = UserDefaults.standard.integer(forKey: "totalTonesAnalyzed")
                UserDefaults.standard.set(tonesAnalyzed + tones.documentTone.tones!.count, forKey: "totalTonesAnalyzed")
                
                DispatchQueue.main.async {
                    let viewController = ToneAnalyzerResultsTableViewController()
                    viewController.tones = tones.documentTone.tones!
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showAlertMessage(_ string:String){
        let alert = UIAlertController(title: "Watson Services", message: string, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
