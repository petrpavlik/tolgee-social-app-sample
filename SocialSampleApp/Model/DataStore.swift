//
//  DataStore.swift
//  SocialSampleApp
//
//  Created by Petr Pavlik on 20.01.2026.
//

import Foundation
import Observation

@MainActor
@Observable
class DataStore {
    var tweets: [Tweet] = []
    var currentUser: User
    
    let sampleUsers: [User]
    
    init() {
        // Create sample users
        let currentUser = User(
            username: "you",
            displayName: "You",
            bio: "Just another Twitter user",
            avatarColor: "blue",
            followingCount: 245,
            followerCount: 1203
        )
        
        self.currentUser = currentUser
        
        self.sampleUsers = [
            currentUser,
            User(username: "sarah_dev", displayName: "Sarah Johnson", bio: "iOS Developer 📱 | SwiftUI enthusiast", avatarColor: "purple", followingCount: 312, followerCount: 1547),
            User(username: "tech_mike", displayName: "Mike Chen", bio: "Tech entrepreneur | Building the future", avatarColor: "green", followingCount: 891, followerCount: 5234),
            User(username: "design_emma", displayName: "Emma Wilson", bio: "UI/UX Designer | Making apps beautiful", avatarColor: "pink", followingCount: 423, followerCount: 892),
            User(username: "code_ninja", displayName: "Alex Martinez", bio: "Full-stack developer | Coffee addict ☕️", avatarColor: "orange", followingCount: 156, followerCount: 743),
            User(username: "data_scientist", displayName: "Dr. Rachel Kim", bio: "Data Science | ML | AI Research", avatarColor: "indigo", followingCount: 678, followerCount: 3421)
        ]
        
        // Create sample tweets
        self.tweets = createSampleTweets()
    }
    
    func createSampleTweets() -> [Tweet] {
        let now = Date()
        return [
            Tweet(
                author: sampleUsers[1],
                content: "Just released my new SwiftUI library! Check it out on GitHub 🚀",
                timestamp: now.addingTimeInterval(-3600),
                likes: 142,
                retweets: 23,
                replies: 8
            ),
            Tweet(
                author: sampleUsers[2],
                content: "Excited to announce that we've raised our Series A! Can't wait to share what we're building. 💪",
                timestamp: now.addingTimeInterval(-7200),
                likes: 523,
                retweets: 89,
                replies: 34
            ),
            Tweet(
                author: sampleUsers[3],
                content: "Hot take: Dark mode is overrated. There, I said it. 🌙",
                timestamp: now.addingTimeInterval(-10800),
                likes: 89,
                retweets: 12,
                replies: 67
            ),
            Tweet(
                author: sampleUsers[4],
                content: "Pro tip: Always write tests before pushing to production. Trust me on this one... 😅",
                timestamp: now.addingTimeInterval(-14400),
                likes: 267,
                retweets: 45,
                replies: 19
            ),
            Tweet(
                author: sampleUsers[5],
                content: "New blog post: \"Understanding Transformers in Machine Learning\" - Link in bio!",
                timestamp: now.addingTimeInterval(-18000),
                likes: 334,
                retweets: 67,
                replies: 22
            ),
            Tweet(
                author: sampleUsers[1],
                content: "SwiftUI animations are so satisfying when they work perfectly ✨",
                timestamp: now.addingTimeInterval(-21600),
                likes: 198,
                retweets: 31,
                replies: 14
            ),
            Tweet(
                author: sampleUsers[2],
                content: "Building in public is scary but rewarding. Day 47 of our startup journey.",
                timestamp: now.addingTimeInterval(-25200),
                likes: 421,
                retweets: 56,
                replies: 28
            ),
            Tweet(
                author: sampleUsers[3],
                content: "Designers: Please use real content in your mockups. Lorem ipsum doesn't help anyone.",
                timestamp: now.addingTimeInterval(-28800),
                likes: 712,
                retweets: 123,
                replies: 45
            )
        ]
    }
    
    func postTweet(content: String) {
        let newTweet = Tweet(
            author: currentUser,
            content: content,
            timestamp: Date(),
            likes: 0,
            retweets: 0,
            replies: 0
        )
        tweets.insert(newTweet, at: 0)
    }
    
    func toggleLike(tweet: Tweet) {
        if let index = tweets.firstIndex(where: { $0.id == tweet.id }) {
            tweets[index].isLiked.toggle()
            tweets[index].likes += tweets[index].isLiked ? 1 : -1
        }
    }
    
    func toggleRetweet(tweet: Tweet) {
        if let index = tweets.firstIndex(where: { $0.id == tweet.id }) {
            tweets[index].isRetweeted.toggle()
            tweets[index].retweets += tweets[index].isRetweeted ? 1 : -1
        }
    }
}
