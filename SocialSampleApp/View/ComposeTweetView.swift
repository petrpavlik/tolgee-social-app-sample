//
//  ComposeTweetView.swift
//  SocialSampleApp
//
//  Created by Petr Pavlik on 20.01.2026.
//

import SwiftUI

struct ComposeTweetView: View {
    @Environment(\.dismiss) var dismiss
    let dataStore: DataStore
    @State private var tweetText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(.buttonCancel) {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Button(.buttonPost) {
                        dataStore.postTweet(content: tweetText)
                        dismiss()
                    }
                    .bold()
                    .disabled(tweetText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()
                
                Divider()
                
                // Compose area
                HStack(alignment: .top, spacing: 12) {
                    Circle()
                        .fill(.blue)
                        .frame(width: 48, height: 48)
                        .overlay(
                            Text(dataStore.currentUser.displayName.prefix(1))
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        )
                    
                    TextEditor(text: $tweetText)
                        .font(.body)
                        .frame(minHeight: 100)
                        .scrollContentBackground(.hidden)
                }
                .padding()
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}
