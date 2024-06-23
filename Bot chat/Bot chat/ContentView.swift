//
//  ContentView.swift
//  Bot chat
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to Chat Bot V.1.0"]
        
    var body: some View {
        VStack {
            HStack(alignment: .center)
            {
                Text("iBot")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")  
                    .font(.system(size: 30))
                    .foregroundColor(Color.blue)
            }
            
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            
                            
                            
                            Spacer()
                             ZStack(alignment: .topLeading){
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, -5 )
                                .padding(.bottom, 10)
                            Image("moon")
                             .resizable()
                             .frame(width: 40, height: 40)
                             .offset(x : -20 , y : -20)
                        }
                                Image("cat")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(.horizontal, 1)
                                    .padding(.bottom, 10)
                                 //   .offset(x: 10, y: 10)
                                
                               
                            }
                        }
                     
                else {
                        HStack {
                        
                            Image("botim")
                                  .resizable()
                                  .frame(width: 60, height: 60)
                                  .padding(.horizontal, 1)
                                  .padding(.bottom, 10)
                       
                            
                            ZStack(alignment: .bottomLeading) {
                                Text(message)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(.white.opacity(1.0))
                                    .cornerRadius(10)
                                    
                                
                                Image("star")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .offset(x: -10, y: 10)
                                
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Image("sky").resizable().opacity(0.7).frame(width: 400 , height: 600))
              //  .background(Color.gray.opacity(1))
                
              
            
            HStack {
                TextField("Type something |", text: $messageText)
                    .padding()
                    .background(Color.black.opacity(0))
                    .onSubmit {
                       SendMessage(message: messageText)
                        
                    }
             //       .focused(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=$isFocused@*/FocusState<Bool>().projectedValue/*@END_MENU_TOKEN@*/)
                
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
