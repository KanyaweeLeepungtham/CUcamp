//
//  ContentView.swift
//  Bot chat
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to Chat Bot 1.0"]
        
    var body: some View {
        VStack {
            HStack {
                Text("iBot")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")    .font(.system(size: 26))
                    .foregroundColor(Color.blue)
            }
            
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            
                            Text(message)
                                .padding()
                                .foregroundColor(.white)
                                .background(.gray.opacity(1.0))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
            
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .onSubmit {
                       SendMessage(message: messageText)
                    }
                
                Button {
                    // sendMessage
                } label: {
                    Image(systemName: "paperlane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding()
            
        }
    }
    
    func SendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
        
    }
}

#Preview {
    ContentView()
}
