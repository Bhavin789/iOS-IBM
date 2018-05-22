//
//  File.swift
//  loginApp
//
//  Created by Bhavin on 17/12/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import Foundation

class User: NSObject {
    var id:Int?
    var mail: String?
    var first_name: String?
    var last_name: String?
    
    init(mail: String?, first_name: String?, last_name: String?, id: Int?){
        self.mail = mail
        self.first_name = first_name
        self.last_name = last_name
        self.id = id
    }
}
