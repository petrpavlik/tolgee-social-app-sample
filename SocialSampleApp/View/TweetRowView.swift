//
//  TweetRowView.swift
//  SocialSampleApp
//
//  Created by Petr Pavlik on 20.01.2026.
//

import SwiftUI

struct TweetRowView: View {
    let tweet: Tweet
    let onLike: () -> Void
    let onRetweet: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Header
            HStack(spacing: 12) {
                // Avatar
                Circle()
                    .fill(avatarColor)
                    .frame(width: 48, height: 48)
                    .overlay(
                        Text(tweet.author.displayName.prefix(1))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    )
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(tweet.author.displayName)
                        .font(.headline)
                    Text(verbatim: "@\(tweet.author.username)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text(timeAgo)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            // Content
            Text(tweet.content)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
            
            // Action buttons
            HStack(spacing: 40) {
                Button(action: {}) {
                    Label {
                        Text(tweet.replies, format: .number)
                    } icon: {
                        Image(systemName: "bubble.left")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                
                Button(action: onRetweet) {
                    Label {
                        Text(tweet.retweets, format: .number)
                    } icon: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                    .font(.subheadline)
                    .foregroundColor(tweet.isRetweeted ? .green : .secondary)
                }
                
                Button(action: onLike) {
                    Label {
                        Text(tweet.likes, format: .number)
                    } icon: {
                        Image(systemName: tweet.isLiked ? "heart.fill" : "heart")
                    }
                    .font(.subheadline)
                    .foregroundColor(tweet.isLiked ? .red : .secondary)
                }
                
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
    
    private var avatarColor: Color {
        switch tweet.author.avatarColor {
        case "blue": return .blue
        case "purple": return .purple
        case "green": return .green
        case "pink": return .pink
        case "orange": return .orange
        case "indigo": return .indigo
        default: return .gray
        }
    }
    
    private var timeAgo: String {
        let seconds = Date().timeIntervalSince(tweet.timestamp)
        if seconds < 60 {
            return "\(Int(seconds))s"
        } else if seconds < 3600 {
            return "\(Int(seconds / 60))m"
        } else if seconds < 86400 {
            return "\(Int(seconds / 3600))h"
        } else {
            return "\(Int(seconds / 86400))d"
        }
    }
}
