//
//  ContentView.swift
//  HomeWork 3.6. Animations
//
//  Created by Ирина on 07.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showAward = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: buttonAction) {
                    HStack {
                        Text(showAward ? "Hide Award" : "Show Award")
                        Spacer()
                    }
                }
                WavesView()
            }
            Spacer()
            DropRainView()
                .frame(width: 100, height: 100)
                .opacity(showAward ? 0 : 1)
                .offset(y: showAward ? 190 : -320)
                .animation(.easeOut(duration: 1.25), value: showAward)
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            showAward.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
