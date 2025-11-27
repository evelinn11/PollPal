//
//  ProfileView.swift
//  Pollpal
//
//  Created by student on 27/11/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                Image("mountain") //local image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 230)
                    .clipped()
                    .opacity(0.7)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Button(action: {}) {
                    Image(systemName: "pencil") //local image
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding(.trailing, 10)
                .padding(.bottom, 10)
            }
            
            HStack {
                Spacer()
                
                Circle()
                    .stroke(Color(hex:"#0C4254"), lineWidth: 4)
                    .frame(width: 140, height: 140)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                        Image("cat")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                            .frame(width: 132, height: 132)
                    )
                
                Spacer()
            }

            .offset(y: -70)
            
            VStack {
                Text("Talitha Celin")
                    .font(.title)
                    .padding(.top, -60)
                    .foregroundColor(Color(hex:"#0C4254"))
                
                Text("My Interest: Gaming, Science")
                    .padding(.top, -30)
                    .foregroundColor(Color(hex:"#0C4254"))
                
                Button("Add More Category") {
                    // action
                }
                .font(.subheadline)
                .padding(.horizontal, 15)
                .padding(.vertical, 8)
                .background(Color(hex:"#0C4254"))
                .foregroundColor(.white)
                .cornerRadius(20)
                
                HStack (spacing: 20){
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(hex:"#0C4254"), lineWidth: 2))
                                .frame(width: 120, height: 80)
                        
                        VStack{
                            Text("My Points")
                                .font(.subheadline)
                            
                            Text("50,000")
                                .font(.title3)
                                .foregroundColor(Color(hex:"#FE982A"))
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(hex:"#0C4254"), lineWidth: 2))
                                .frame(width: 120, height: 80)
                        
                        VStack{
                            Text("Total Survey")
                                .font(.subheadline)
                            
                            Text("20")
                                .font(.title3)
                                .foregroundColor(Color(hex:"#FE982A"))
                        }
                    }
                                    
                }
                .padding(.top, 15)
                
                Divider() //
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                
                VStack{
                    Button(action: { /* Action for Help */ }) {
                        HStack(spacing: 15) {
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(Color(hex:"#0C4254"))
                                        
                                Text("Help")
                                .font(.body)
                                .foregroundColor(Color(hex:"#0C4254"))
                                                
                                Spacer()
                                    
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hex:"#0C4254"))
                                        }
                                    }
                                .buttonStyle(.plain)
                                .padding(.trailing, 30)
                                .padding(.bottom, 20)
                    
                    Button(action: { /* Action for Help */ }) {
                        HStack(spacing: 15) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(Color(hex:"#0C4254"))
                                        
                                Text("Setting")
                                .font(.body)
                                .foregroundColor(Color(hex:"#0C4254"))
                                                
                                Spacer()
                                    
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hex:"#0C4254"))
                                        }
                                    }
                                .buttonStyle(.plain)
                                .padding(.trailing, 30)
                                .padding(.bottom, 20)
                    
                    Button(action: { /* Action for Help */ }) {
                        HStack(spacing: 15) {
                            Image(systemName: "person.2.circle")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(Color(hex:"#0C4254"))
                                        
                                Text("Change Account")
                                .font(.body)
                                .foregroundColor(Color(hex:"#0C4254"))
                                                
                                Spacer()
                                    
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hex:"#0C4254"))
                                        }
                                    }
                                .buttonStyle(.plain)
                                .padding(.trailing, 30)
                    
                    
                }
                .padding(.leading, 30)
                
                
                Spacer()
            }
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    ProfileView()
}
