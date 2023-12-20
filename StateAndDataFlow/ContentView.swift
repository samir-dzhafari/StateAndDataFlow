//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ColorButton(title: timer.buttonTitle, color: .red, action: timer.startTimer)
            
            Spacer()
            
            ColorButton(title: "Logout", color: .gray) {
                userManager.isLoggedIn.toggle()
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}

struct ColorButton: View {
    
    var title: String
    let color: Color
    
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
