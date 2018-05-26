//
//  LogTableViewCell.swift
//  loginApp
//
//  Created by Bhavin on 26/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit

class LogTableViewCell: UITableViewCell {
    
    var log: Log?{
        didSet{
            
            //detailTextLabel?.text = "KEYWORDS: \(log?.keywords)"
            //self.textLabel?.text = log?.title
            
            titleLabel.text = log?.title!
            keywordsLabel.text = log?.keywords!
            
            if(log?.feedback == ""){
                reviewLabel.text = "NONE"
            }else{
                reviewLabel.text = log?.feedback!
            }
            if let time = log?.time{
                
                var dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                var dateString = dateFormatter.string(from: time)
                timeLabel.text = dateString
            }
        }
    }
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        label .translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let apiLabel: UILabel = {
        let label = UILabel()
        label.text = "API CALLED"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL TONES ANALYZED nn"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let keywordLabel: UILabel = {
        let label = UILabel()
        label.text = "KEYWORDS"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let keywordsLabel: UILabel = {
        let label = UILabel()
        label.text = "KEYWORDS nn"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let userLabel: UILabel = {
        let label = UILabel()
        label.text = "USER FEEDBACK"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "KEYWORDS nn"
        // label.backgroundColor = UIColor.green
        label.font = UIFont(name: "HelveticaNeue", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        /*
        textLabel?.frame = CGRect(x: 0, y: (textLabel?.frame.origin.y)!, width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        textLabel?.backgroundColor = .red
        
        self.contentView.backgroundColor = .blue
        self.inputView?.backgroundColor = .gray
        
        detailTextLabel?.frame = CGRect(x: 0, y: (detailTextLabel?.frame.origin.y)!, width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
        detailTextLabel?.backgroundColor = .green*/
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(timeLabel)
        addSubview(apiLabel)
        addSubview(titleLabel)
        addSubview(keywordLabel)
        addSubview(keywordsLabel)
        addSubview(userLabel)
        addSubview(reviewLabel)
        
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        apiLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8).isActive = true
        apiLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
        apiLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        apiLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: apiLabel.bottomAnchor, constant: 6).isActive = true
        
        keywordLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8).isActive = true
        keywordLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
        keywordLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        keywordLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        
        keywordsLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8).isActive = true
        keywordsLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
        keywordsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        keywordsLabel.topAnchor.constraint(equalTo: keywordLabel.bottomAnchor, constant: 6).isActive = true
        
        userLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8).isActive = true
        userLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
        userLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userLabel.topAnchor.constraint(equalTo: keywordsLabel.bottomAnchor, constant: 12).isActive = true
        
        reviewLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8).isActive = true
        reviewLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
        reviewLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        reviewLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 6).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
