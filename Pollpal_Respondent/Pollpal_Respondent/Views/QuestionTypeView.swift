import SwiftUI

struct QuestionTypeView: View {
    @Binding var question: Question
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(question.title)
                .font(.title3).bold()
            
            switch question.type {
                
            case .shortAnswer:
                TextField("Answer...", text: Binding(
                    get: { question.answer as? String ?? "" },
                    set: { question.answer = $0 }
                ))
                .textFieldStyle(.roundedBorder)
            
            case .paragraph:
                TextEditor(text: Binding(
                    get: { question.answer as? String ?? "" },
                    set: { question.answer = $0 }
                ))
                .frame(height: 120)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
            
            case .multipleChoice:
                if let opts = question.options {
                    ForEach(opts, id: \.self) { option in
                        HStack {
                            Image(systemName: (question.answer as? String == option) ? "circle.inset.filled" : "circle")
                                .onTapGesture { question.answer = option }
                            Text(option)
                        }
                    }
                }
                
            case .checkboxes:
                if let opts = question.options {
                    ForEach(opts, id: \.self) { option in
                        Toggle(option,
                               isOn: Binding(
                                get: {
                                    let arr = question.answer as? [String] ?? []
                                    return arr.contains(option)
                                },
                                set: { checked in
                                    var arr = question.answer as? [String] ?? []
                                    if checked { arr.append(option) }
                                    else { arr.removeAll { $0 == option } }
                                    question.answer = arr
                                }
                               ))
                    }
                }
                
            case .dropdown:
                if let opts = question.options {
                    Picker("Select", selection: Binding(
                        get: { (question.answer as? String) ?? "" },
                        set: { question.answer = $0 }
                    )) {
                        ForEach(opts, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
            case .linearScale:
                if let range = question.scaleRange {
                    HStack {
                        ForEach(range, id: \.self) { num in
                            Button {
                                question.answer = num
                            } label: {
                                Text("\(num)")
                                    .padding(10)
                                    .background(
                                        (question.answer as? Int == num)
                                        ? Color.orange.opacity(0.3)
                                        : Color.gray.opacity(0.15)
                                    )
                                    .cornerRadius(8)
                            }
                        }
                    }
                }
            }
        }
        .padding(.vertical)
    }
}
