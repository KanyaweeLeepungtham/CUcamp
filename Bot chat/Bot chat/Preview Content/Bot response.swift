//
//  Bot response.swift
//  Bot chat
//
//  Created by admin on 22/6/2567 BE.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "Hey there!"
    } else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    } else if tempMessage.contains("how old are you") {
        return "I'm xxxx year old"
    } else if tempMessage.contains("weather") {
        return " I guess it will sunnt all day!!!"
    } else if tempMessage.contains("what are you doing") {
        return " I'm talking with you!!"
    } else {
        return "That's cool."
    } 
    
}
