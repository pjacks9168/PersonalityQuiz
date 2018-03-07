//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Paul Jacks on 3/7/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//
import Foundation

struct Question {
var text : String
var type : String
var answers : [Answer]
    }

enum ResponseType {
    case single,multiple, ranged
}

struct Answer {
    var text : String
    var type : AnimalType
}

enum AnimalType: Character{
    case dog = "🐶", snake = "🐍", tiger = "🐯", cow = "🐮"
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with people you love, and enjoy activities with your friends."
        case .snake:
            return "You always do what you want. When you want something you want, you get it by whatever it takes. You lie and cheat and dont care about anyone but yourself"
        case .tiger:
        return "You are fierce. You are a leader and people admire you. They know you care about them but dont show it dirrectly. They also not to cross you becayse that is a mistake."
        case .cow:
            return "You are relaxed and dont let many things bother you. People like being around and with you. No one can hate you because there is nothing to hate"
        }
    }
}
