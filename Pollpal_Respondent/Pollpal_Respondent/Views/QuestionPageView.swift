import SwiftUI

struct QuestionPageView: View {
    @Binding var question: Question
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            QuestionTypeView(question: $question)
            
            Spacer()
        }
        .padding()
    }
}
