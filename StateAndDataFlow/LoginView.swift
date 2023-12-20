//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                
                Text("\(name.count)/\(20)")
                    .font(.caption)
                    .foregroundStyle(((3...20) ~= name.count ? .green : .red))
            }
            .padding()
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
                    .disabled(!((3...20) ~= name.count))
            }
        }
    }
    
    private func login() {
        if !name.isEmpty {
            userManager.name = name
            userManager.isLoggedIn.toggle()
        }
    }
}

#Preview {
    LoginView()
}
