//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVMExample
//
//  Created by Oscar Martinez on 19/3/21.
//

import UIKit


struct PersonFollowingTableViewCellViewModel {
    let name: String
    let username: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        self.name = model.name
        self.username = model.userName
        self.currentlyFollowing = false
        self.image = UIImage(systemName: "person")
    }
}

