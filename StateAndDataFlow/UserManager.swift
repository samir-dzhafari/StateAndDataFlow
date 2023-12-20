//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

final class UserManager: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false {
        didSet {
            if !isLoggedIn {
                name = ""
            }
        }
    }
    
    @AppStorage("name") var name = ""
}
