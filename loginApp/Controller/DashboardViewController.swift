//
//  DashboardViewController.swift
//  loginApp
//
//  Created by Bhavin on 25/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var myView: UIView!
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.black
        button.setTitle("OK", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.shadowRadius = 5
        button.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "DASHBOARD"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let nameSeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let toneLabel: UILabel = {
        let label = UILabel()
        label.text = "TONE ANALYZER"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let toneSeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let totalToneLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL TONES ANALYZED"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let personalityLabel: UILabel = {
        let label = UILabel()
        label.text = "PERSONALITY INSIGHTS"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let personalitySeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let emotionalLabel: UILabel = {
        let label = UILabel()
        label.text = "AVERAGE EMOTIONAL PERCENTILE"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let curiosityLabel: UILabel = {
        let label = UILabel()
        label.text = "AVERAGE CURIOSITY PERCENTILE"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let changeToneLabel: UILabel = {
        let label = UILabel()
        label.text = "AVERAGE CHANGE PERCENTILE"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let nlpLabel: UILabel = {
        let label = UILabel()
        label.text = "LANGUAGE UNDERSTANDING"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let negativeLabel: UILabel = {
        let label = UILabel()
        label.text = "NEGATIVE EMOTIONS ANALYZED"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let positiveLabel: UILabel = {
        let label = UILabel()
        label.text = "POSITIVE EMOTIONS ANALYZED"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let nlpSeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let emotionsRecievedLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL EMOTIONS RECIEVED"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let assistantLabel: UILabel = {
        let label = UILabel()
        label.text = "WATSON ASSISTANT"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let assistantSeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let sentLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL MESSAGES SENT"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let recievedLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL MESSAGES RECIEVED"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "LANGUAGE TRANSLATOR"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let languageSeparator: UIView = {
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.black
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let totalLanguagesLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL TEXT TRANSLATED"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.backgroundColor = UIColor.white
        self.view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 350)
        
        myView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + 330))
        myView.backgroundColor = UIColor.white
        
        scrollView.addSubview(myView)
        
        myView.addSubview(closeButton)
        myView.addSubview(nameLabel)
        //myView.addSubview(nameSeparator)
        myView.addSubview(toneLabel)
        myView.addSubview(toneSeparator)
        myView.addSubview(totalToneLabel)
        myView.addSubview(personalityLabel)
        myView.addSubview(personalitySeparator)
        myView.addSubview(emotionalLabel)
        myView.addSubview(curiosityLabel)
        myView.addSubview(changeToneLabel)
        myView.addSubview(languageLabel)
        myView.addSubview(languageSeparator)
        myView.addSubview(totalLanguagesLabel)
        myView.addSubview(assistantLabel)
        myView.addSubview(assistantSeparator)
        myView.addSubview(sentLabel)
        myView.addSubview(recievedLabel)
        myView.addSubview(nlpLabel)
        myView.addSubview(nlpSeparator)
        myView.addSubview(positiveLabel)
        myView.addSubview(negativeLabel)
        
        closeButton.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        closeButton.topAnchor.constraint(equalTo: myView.topAnchor, constant: 8).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: myView.topAnchor, constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: 8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        /*
         
         
        nameSeparator.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        nameSeparator.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 30).isActive = true
        nameSeparator.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -30).isActive = true
        nameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        */
        toneLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        toneLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        toneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        toneLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        toneSeparator.topAnchor.constraint(equalTo: toneLabel.bottomAnchor, constant: 0).isActive = true
        toneSeparator.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 0).isActive = true
        toneSeparator.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: 0).isActive = true
        toneSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        totalToneLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        totalToneLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        totalToneLabel.topAnchor.constraint(equalTo: toneSeparator.bottomAnchor, constant: 8).isActive = true
        totalToneLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        personalityLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 12).isActive = true
        personalityLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        personalityLabel.topAnchor.constraint(equalTo: totalToneLabel.bottomAnchor, constant: 8).isActive = true
        personalityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        personalitySeparator.topAnchor.constraint(equalTo: personalityLabel.bottomAnchor, constant: 0).isActive = true
        personalitySeparator.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 0).isActive = true
        personalitySeparator.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: 0).isActive = true
        personalitySeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        emotionalLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        emotionalLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        emotionalLabel.topAnchor.constraint(equalTo: personalitySeparator.bottomAnchor, constant: 8).isActive = true
        emotionalLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        curiosityLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        curiosityLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        curiosityLabel.topAnchor.constraint(equalTo: emotionalLabel.bottomAnchor, constant: 8).isActive = true
        curiosityLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        changeToneLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        changeToneLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        changeToneLabel.topAnchor.constraint(equalTo: curiosityLabel.bottomAnchor, constant: 8).isActive = true
        changeToneLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        languageLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 12).isActive = true
        languageLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        languageLabel.topAnchor.constraint(equalTo: changeToneLabel.bottomAnchor, constant: 8).isActive = true
        languageLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        languageSeparator.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 0).isActive = true
        languageSeparator.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 0).isActive = true
        languageSeparator.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: 0).isActive = true
        languageSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        totalLanguagesLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        totalLanguagesLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        totalLanguagesLabel.topAnchor.constraint(equalTo: languageSeparator.bottomAnchor, constant: 8).isActive = true
        totalLanguagesLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        assistantLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 12).isActive = true
        assistantLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        assistantLabel.topAnchor.constraint(equalTo: totalLanguagesLabel.bottomAnchor, constant: 8).isActive = true
        assistantLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        assistantSeparator.topAnchor.constraint(equalTo: assistantLabel.bottomAnchor, constant: 0).isActive = true
        assistantSeparator.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 0).isActive = true
        assistantSeparator.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: 0).isActive = true
        assistantSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        sentLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        sentLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        sentLabel.topAnchor.constraint(equalTo: assistantSeparator.bottomAnchor, constant: 8).isActive = true
        sentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        recievedLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        recievedLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        recievedLabel.topAnchor.constraint(equalTo: sentLabel.bottomAnchor, constant: 8).isActive = true
        recievedLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nlpLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 12).isActive = true
        nlpLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        nlpLabel.topAnchor.constraint(equalTo: recievedLabel.bottomAnchor, constant: 8).isActive = true
        nlpLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nlpSeparator.topAnchor.constraint(equalTo: nlpLabel.bottomAnchor, constant: 0).isActive = true
        nlpSeparator.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 0).isActive = true
        nlpSeparator.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: 0).isActive = true
        nlpSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        negativeLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        negativeLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        negativeLabel.topAnchor.constraint(equalTo: nlpSeparator.bottomAnchor, constant: 8).isActive = true
        negativeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        positiveLabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 8).isActive = true
        positiveLabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -8).isActive = true
        positiveLabel.topAnchor.constraint(equalTo: negativeLabel.bottomAnchor, constant: 8).isActive = true
        positiveLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let tonesAnalyzed = UserDefaults.standard.integer(forKey: "totalTonesAnalyzed")
        let totalTextTranslated = UserDefaults.standard.integer(forKey: "totalTextTranslated")
        let totalMessagesSent = UserDefaults.standard.integer(forKey: "totalMessagesSent")
        let totalMessagesReceived = UserDefaults.standard.integer(forKey: "totalMessagesRecieved")
        let negativeEmotionsAnalyzed = UserDefaults.standard.integer(forKey: "negativeEmotionsAnalyzed")
        let positiveEmotionAnalyzed = UserDefaults.standard.integer(forKey: "positiveEmotionAnalyzed")
        let emotionPercentile = UserDefaults.standard.double(forKey: "emotionPercentile")
        let curiosityPercentile = UserDefaults.standard.double(forKey: "curiosityPercentile")
        let changePercentile = UserDefaults.standard.double(forKey: "changePercentile")
        
        
        totalToneLabel.text = "TOTAL TONES ANALYZED : \(tonesAnalyzed)"
        emotionalLabel.text = "AVERAGE EMOTIONAL PERCENTILE : \(emotionPercentile)"
        curiosityLabel.text = "AVERAGE CURIOSITY PERCENTILE : \(curiosityPercentile)"
        changeToneLabel.text = "AVERAGE CHANGE PERCENTILE : \(changePercentile)"
        totalLanguagesLabel.text = "TOTAL TEXT TRANSLATED : \(totalTextTranslated)"
        sentLabel.text = "TOTAL MESSAGES SENT : \(totalMessagesSent)"
        recievedLabel.text = "TOTAL MESSAGES RECIEVED : \(totalMessagesReceived)"
        negativeLabel.text = "NEGATIVE EMOTIONS ANALYZED : \(negativeEmotionsAnalyzed)"
        positiveLabel.text = "POSITIVE EMOTIONS ANALYZED : \(positiveEmotionAnalyzed)"
        

        // Do any additional setup after loading the view.
    }
    
    @objc func handleClose(){
        self.dismiss(animated: true, completion: nil)
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
