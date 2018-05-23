//
//  AssistantUser.swift
//  loginApp
//
//  Created by Bhavin on 23/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import Foundation
import JSQMessagesViewController

enum AssistantUser: String {
    case me = "053496-4509-288"
    case watson = "053496-4509-289"
    
    static func getName(_ user: AssistantUser) -> String {
        switch user {
        case .me: return "Me"
        case .watson: return "Watson"
        }
    }
    
    static func getAvatar(_ id: String) -> JSQMessagesAvatarImage? {
        let user = AssistantUser(rawValue: id)!
        switch user {
        case .me: return nil
        case .watson: return avatarWatson
        }
    }
}

private let avatarWatson = JSQMessagesAvatarImageFactory.avatarImage(
    with: #imageLiteral(resourceName: "watson_avatar"),
    diameter: 24
)
