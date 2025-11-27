//
//  ListSurveyView.swift
//  Pollpal
//
//  Created by student on 21/11/25.
//

import SwiftUI

struct AvailableSurvey: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let reward: Int?        // optional → bisa null
    let estimatedTime: Int? // menit
}

struct ListSurveyView: View {
    
    // Survey yang belum pernah dikerjakan
    let surveys: [AvailableSurvey] = [
        AvailableSurvey(title: "Survey Kepuasan Pelayanan",
                        category: "Public Service",
                        reward: 150,
                        estimatedTime: 5),
        
        AvailableSurvey(title: "Survey Kebiasaan Belanja Mahasiswa",
                        category: "Daily Life",
                        reward: 100,
                        estimatedTime: 7),
        
        AvailableSurvey(title: "Survey Desain Aplikasi Mobile",
                        category: "Design",
                        reward: 200,
                        estimatedTime: 10),
        
        AvailableSurvey(title: "Persepsi Teknologi AI di Masyarakat",
                        category: "Technology",
                        reward: 250,
                        estimatedTime: 12)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Available Surveys")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#0C4254"))
                .padding(.leading)
                .padding(.top)
            
            ScrollView {
                VStack(spacing: 18) {
                    
                    ForEach(surveys) { survey in
                        NavigationLink {
                            SurveyQuestionPager(surveyTitle: survey.title)
                        } label: {
                            SurveyAvailableRow(item: survey)
                        }
                    }
                }
                .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct SurveyAvailableRow: View {
    
    let item: AvailableSurvey
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // Category
            Text(item.category)
                .font(.caption)
                .foregroundColor(.gray)
            
            // Title
            Text(item.title)
                .font(.headline)
                .foregroundColor(Color(hex: "#0C4254"))
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding(.bottom, 15)
            
            HStack(spacing: 20) {
                
                if let reward = item.reward {
                    HStack(spacing: 6) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(hex: "#FE982A"))
                        Text("\(reward) pts")
                            .font(.caption)
                            .foregroundColor(Color(hex: "#FE982A"))
                    }
                }
                
                if let time = item.estimatedTime {
                    HStack(spacing: 6) {
                        Image(systemName: "clock")
                            .foregroundColor(.gray)
                        Text("\(time) min")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                Text("Start Now →")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#FE982A"))
                    .padding(.horizontal)
                    .underline()
            }
        }
        .padding()
        .frame(width: 360, alignment: .leading)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 4, y: 2)
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        ListSurveyView()
    }
}
