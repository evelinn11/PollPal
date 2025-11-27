import SwiftUI

struct SurveyQuestionPager: View {
    @State private var index = 0
    
    @State private var questions: [Question] = [
        Question(title: "Nama lengkap?", type: .shortAnswer, options: nil, scaleRange: nil),
        Question(title: "Ceritakan pengalaman kamu", type: .paragraph, options: nil, scaleRange: nil),
        Question(title: "Pilih salah satu", type: .multipleChoice, options: ["A", "B", "C"], scaleRange: nil),
        Question(title: "Apa yang kamu sukai?", type: .checkboxes, options: ["A", "B", "C"], scaleRange: nil),
        Question(title: "Pilih dari dropdown", type: .dropdown, options: ["X", "Y", "Z"], scaleRange: nil),
        Question(title: "Skala 1–5", type: .linearScale, options: nil, scaleRange: Array(1...5))
    ]
    
    var surveyTitle: String = ""
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(questions.indices, id: \.self) { i in
                    QuestionPageView(question: $questions[i])
                        .tag(i)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            HStack {
                if index > 0 {
                    Button("Back") { index -= 1 }
                }
                Spacer()
                if index < questions.count - 1 {
                    Button("Next") { index += 1 }
                } else {
                    Button("Finish") {
                        print("Answers:", questions.map { $0.answer ?? "nil" })
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(surveyTitle)
    }
}
