//
//  Person.swift
//  MVVMExample
//
//  Created by Oscar Martinez on 16/3/21.
//

import UIKit

enum Gender {
    case male, female, undefined
}

struct Person {
    let name: String
    let birthday: Date?
    let middleName: String?
    let address: String?
    let gender: Gender
    
    var userName = "Osukaru"
    
    init (name: String,
          birthday: Date? = nil,
          middleName: String? = nil,
          address: String? = nil,
          gender: Gender = .undefined) {
        
        self.name = name
        self.birthday = birthday
        self.middleName = middleName
        self.address = address
        self.gender = gender
    }
}
