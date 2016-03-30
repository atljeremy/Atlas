//
//  User.swift
//  Atlas
//
//  Created by Jeremy Fox on 3/30/16.
//  Copyright © 2016 RentPath. All rights reserved.
//

import Foundation
import Atlas

struct User {
    
    let firstName: String?
    let lastName: String?
    let email: String
    let phone: Int?
    let avatarURL: String?
    let isActive: Bool
    let memberSince: NSDate?
    
}

extension User: AtlasJSONMappable {
    
    func toJSON() -> [String : AnyObject]? {
        return nil
    }
    
    init?(json: JSON) throws {
        do {
            let map = try Atlas(json)
            firstName = try map.key("first_name").to(String)
            lastName = try map.key("last_name").to(String)
            email = try map.key("email").to(String) ?? ""
            phone = try map.key("phone").to(Int)
            avatarURL = try map.key("avatar").to(String)
            isActive = try map.key("is_active").to(Bool) ?? false
            memberSince = try map.key("member_since").toRFC3339Date()
        } catch let e {
            throw e
        }
    }
    
}
