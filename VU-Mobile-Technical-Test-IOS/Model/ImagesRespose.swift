//
//  ImagesRespose.swift
//  VU-Mobile-Technical-Test-IOS
//
//  Created by Kazi Md. Saidul on 4/28/20.
//  Copyright © 2020 Kazi Md. Saidul. All rights reserved.
//

import Foundation
//import EVReflection
// MARK: - Welcome
class ImagesRespose {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let ad: Ad
    
    init(page: Int, perPage: Int, total: Int, totalPages: Int, data: [Datum], ad: Ad) {
        self.page = page
        self.perPage = perPage
        self.total = total
        self.totalPages = totalPages
        self.data = data
        self.ad = ad
    }
}

// MARK: - Ad
class Ad  {
    let company: String
    let url: String
    let text: String
    
    init(company: String, url: String, text: String) {
        self.company = company
        self.url = url
        self.text = text
    }
}

// MARK: - Datum
class Datum {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    
    init(id: Int, email: String, firstName: String, lastName: String, avatar: String) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
}
