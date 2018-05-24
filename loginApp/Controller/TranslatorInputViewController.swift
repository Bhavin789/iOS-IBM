//
//  TranslatorInputViewController.swift
//  loginApp
//
//  Created by Bhavin on 25/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit
import LanguageTranslatorV2

class TranslatorInputViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var heading: String!
    var languageArray = [[String: String]]()
    let categoryPicker = UIPickerView()
    var sub: String!
    var modelID: String!
    
    let language1 = ["name" : "Arabic", "sub": "ar", "modelID": "en-ar"]
    let language2 = ["name" : "German", "sub": "de", "modelID": "en-de"]
    let language3 = ["name" : "Italian", "sub": "it", "modelID": "en-it"]
    let language4 = ["name" : "Spanish", "sub": "es", "modelID": "en-es"]
    let language5 = ["name" : "Portuguese", "sub": "pt", "modelID": "en-pt"]
    let language6 = ["name" : "French", "sub": "fr", "modelID": "en-fr"]
    let language7 = ["name" : "Japanese", "sub": "ja", "modelID": "en-ja"]
    
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
        sub = ""
        modelID = ""
        self.view.backgroundColor = .white
        self.navigationItem.title = heading
        languageArray = [language1, language2, language3, language4, language5, language6, language7]
        
        view.addSubview(textView)
        view.addSubview(analyzeButton)
        view.addSubview(nameLabel)
        view.addSubview(languageField)
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        
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
        createToolbar()

        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleAnalyze(){
        
        print("translate")
        if(languageField.text?.count == 0){
            showAlertMessage("Enter some text to translate")
        }else{
            let languageTranslator = LanguageTranslator(username: Credentials.TranslatorUsername, password: Credentials.TranslatorPassword)
            
            // set the serviceURL property to use the legacy Language Translation service
            // languageTranslator.serviceURL = "https://gateway.watsonplatform.net/language-translation/api"
            
            let failure = { (error: Error) in print(error) }
            
            let req = TranslateRequest(text: [languageField.text!], modelID: modelID, source: "en", target: sub)
            languageTranslator.translate(request: req, failure: failure) {
                translation in
                let text = translation.translations[0].translationOutput
                
                DispatchQueue.main.async {
                    var viewController = TranslatorResultsViewController()
                    viewController.text = text
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("resigned")
        return true
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        languageField.text = languageArray[row]["name"]
        sub = languageArray[row]["sub"]
        modelID = languageArray[row]["modelID"]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languageArray[row]["name"]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return languageArray.count
    }
    
    func showAlertMessage(_ string:String){
        let alert = UIAlertController(title: "OpenTrip", message: string, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
