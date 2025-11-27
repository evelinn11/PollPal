//
//  Question.swift
//  Pollpal_Respondent
//
//  Created by student on 27/11/25.
//

import Foundation

enum QuestionType {
    case shortAnswer
    case paragraph
    case multipleChoice
    case checkboxes
    case dropdown
    case linearScale
}

struct Question: Identifiable {
    let id = UUID()
    let title: String
    let type: QuestionType
    let options: [String]?
    let scaleRange: [Int]?
    
    // dummy answer storage
    var answer: Any?
}
