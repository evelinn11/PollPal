//
//  ContentView.swift
//  New Survey PollPal
//
//  Created by student on 27/11/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    let orange = Color(red: 254 / 255, green: 152 / 255, blue: 42 / 255)
    let DarkTeal = Color(red: 12 / 255, green: 66 / 255, blue: 84 / 255)
    
    @State private var categoryText: String = ""
    @State private var addedCategories: [String] = ["Food", "Tech"]
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    
    // di view model??
    func addCategory() {
        let trimmedText = categoryText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedText.isEmpty && !addedCategories.contains(trimmedText) {
            addedCategories.append(trimmedText)
            categoryText = "" // Clear the input field
        }
    }
    
    func removeCategory(category: String) {
        if let index = addedCategories.firstIndex(of: category) {
            addedCategories.remove(at: index)
        }
    }
    
    private var imageButtonText: String {
        selectedImage == nil ? "Add Image" : "Change Image"
    }
    
    var body: some View {
        ZStack (alignment: .bottom) {
            // Base background
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // MARK: - Header Section (Fixed Top)
                VStack(alignment: .leading) {
                    Button(action: {
                                            print("Back button tapped")
                                        }) {
                                            Text("<< Back")
                                                .font(.headline)
                                                .foregroundColor(DarkTeal)
                                        }
                                        .padding(.horizontal)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Cooking Mama Surey")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Text("Please fill n the r")
                                               .font(.caption)
                                               .foregroundColor(.white)
                                            .padding(.bottom, 10)
                                        }
                                        .padding([.horizontal])
                                        .padding(.top, 2)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(orange)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Main Survey Text Block
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Survey Kebiasaan dan Hobi di Rumah")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding(.bottom, 2)
                        
                        Text("Deskripsi singkat aja ksjasdhskjd bl;bla hobi apa di rumahh aku si suka bacaa novell :D")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    // Category Management Card
                    VStack(alignment: .leading) {
                        Text("Category")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        // Display the added categories
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(addedCategories, id: \.self) { category in
                                    
                                    HStack(spacing: 5) {
                                        
                                        // 1. Category Text
                                        Text(category)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        
                                        // 2. 'X' Symbol (Close Button)
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .frame(width: 8, height: 8)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 8)
                                    .background(DarkTeal)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        removeCategory(category: category)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 10)
                        
                        // Category Input Field
                        HStack {
                            TextField("Search For Available Category...", text: $categoryText)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Button(action: {
                                addCategory()
                            }) {
                                Text("Add")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 8)
                                    .background(orange)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        Divider()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20) // Consolidated styling
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                    
                    // Image Preview Section
                    if let image = selectedImage {
                        VStack(alignment: .leading) {
                            Text("Uploaded Image")
                                .font(.headline)
                                .padding(.bottom, 5)
                            
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 135)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                        }
                        .padding(.horizontal)
                    }
                    
                    // MARK: - Spacer to clear fixed bottom bar
                    // This pushes the content far enough up so the bottom bar doesn't cover anything.
                    Spacer(minLength: 100)
                    
                } // End of Vstack content
                .padding(.vertical, 20)
                .padding(.trailing,10)
                .padding(.leading,10)
                .offset(y: -50) // Pull the content card up under the header
                
                Spacer() // Pushes the header and content block up to the top
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            // MARK: - Fixed Bottom Bar
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        Text(imageButtonText)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(DarkTeal)
                            .cornerRadius(10)
                            .font(.subheadline)
                    }
                    .onChange(of: selectedItem) { _, newItem in
                        guard let newItem = newItem else { return }
                        Task {
                            if let data = try? await newItem.loadTransferable(type: Data.self) {
                                await MainActor.run {
                                    if let uiImage = UIImage(data: data) {
                                        selectedImage = Image(uiImage: uiImage)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.trailing, 30)
                .padding(.bottom, 20)
                
                HStack {
                    Button(action: { /* Publish Action */ }) {
                        Text("Publish")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(orange)
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .shadow(radius: 10)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
