//
//  TranslatorInputViewController.swift
//  loginApp
//
//  Created by Bhavin on 25/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit
import LanguageTranslatorV2

class TranslatorInputViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate {
    
    var heading: String!
    var languageArray = [[String: String]]()
    let categoryPicker = UIPickerView()
    
    let language1 = ["name" : "Vietnamese", "sub": "vi"]
    let language2 = ["name" : "Urdu", "sub": "ur"]
    let language3 = ["name" : "Turkish", "sub": "tr"]
    let language4 = ["name" : "Telugu", "sub": "te"]
    let language5 = ["name" : "Spanish", "sub": "es"]
    let language6 = ["name" : "Russian", "sub": "ru"]
    let language7 = ["name" : "Portuguese", "sub": "pt"]
    let language8 = ["name" : "Panjabi", "sub": "pa"]
    let language9 = ["name" : "Japanese", "sub": "ja"]
    let language10 = ["name" : "Hindi", "sub": "hi"]
    let language11 = ["name" : "English", "sub": "en"]
    
    var textView: UITextView = {
        let view = UITextView()
        var borderColor = UIColor(displayP3Red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1.0
        view.layer.borderColor = borderColor.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let languageField: UITextField = {
        let txtField = UITextField()
        
        txtField.placeholder = "Select Target Language"
        txtField.translatesAutoresizingMaskIntoConstraints = false
        
        return txtField
    }()
    
    let analyzeButton: UIButton = {
        let button = UIButton(type: .system)
        //button.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
        button.backgroundColor = UIColor.black
        button.setTitle("TRANSLATE", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleAnalyze), for: .touchUpInside)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ENTER TEXT IN ENGLISH"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        var languageArray = [language1, language2, language3, language4, language5, language6, language7, language8, language9, language10, language11]
        
        view.addSubview(textView)
        view.addSubview(analyzeButton)
        view.addSubview(nameLabel)
        view.addSubview(languageField)
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        textView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        languageField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        languageField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        languageField.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8).isActive = true
        languageField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        analyzeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        analyzeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        analyzeButton.topAnchor.constraint(equalTo: languageField.bottomAnchor, constant: 20).isActive = true
        analyzeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        languageField.delegate = self
        createCategoryPicker()
        

        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleAnalyze(){
        
    }
    
    func createCategoryPicker(){
        // let categoryPicker = UIPickerView()
        categoryPicker.delegate = self
        languageField.inputView = categoryPicker
    }
    
    func createToolbar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        toolbar.setItems([cancelButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        toolbar.tintColor = UIColor.black
        languageField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard(){
        print("called")
        view.endEditing(true)
        // print(currentTextField)
        languageField.resignFirstResponder()
    }
    
    @objc func handleCancel(){
        view.endEditing(true)
        languageField.text = ""
        categoryPicker.removeFromSuperview()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        languageField.text = ""
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
