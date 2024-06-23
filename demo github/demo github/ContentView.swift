//
//  ContentView.swift
//  demo github
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("This is Github Demo")
            Text("I've collaborated")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
