//
//  ContentView.swift
//  SocialSampleApp
//
//  Created by Petr Pavlik on 20.01.2026.
//

import SwiftUI
import Assets

struct ContentView: View {
    @State private var dataStore = DataStore()
    @State private var showingCompose = false
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Home Feed
            NavigationView {
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(dataStore.tweets) { tweet in
                            VStack(spacing: 0) {
                                TweetRowView(
                                    tweet: tweet,
                                    onLike: { dataStore.toggleLike(tweet: tweet) },
                                    onRetweet: { dataStore.toggleRetweet(tweet: tweet) }
                                )
                                
                                Divider()
                            }
                        }
                    }
                }
                .navigationTitle(.Tweets.title)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { showingCompose = true }) {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
            }
            .tabItem {
                Label(.Tweets.title, systemImage: "house")
            }
            .tag(0)
            
            // Search
            NavigationView {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    Text(.Search.searchPlaceholder)
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                .navigationTitle(.Search.title)
            }
            .tabItem {
                Label(.Search.title, systemImage: "magnifyingglass")
            }
            .tag(1)
            
            // Notifications
            NavigationView {
                VStack {
                    Image(systemName: "bell")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    Text(.Notifications.noContent)
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                .navigationTitle(.Notifications.title)
            }
            .tabItem {
                Label(.Notifications.title, systemImage: "bell")
            }
            .tag(2)
            
            // Profile
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Header
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .fill(.blue.gradient)
                                .frame(height: 120)
                            
                            Circle()
                                .fill(.blue)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Text(dataStore.currentUser.displayName.prefix(1))
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color(uiColor: .systemBackground), lineWidth: 4)
                                )
                                .offset(x: 16, y: 40)
                        }
                        
                        // Profile info
                        VStack(alignment: .leading, spacing: 8) {
                            Text(dataStore.currentUser.displayName)
                                .font(.title2)
                                .bold()
                            
                            Text(verbatim: "@\(dataStore.currentUser.username)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(dataStore.currentUser.bio)
                                .font(.body)
                                .padding(.top, 4)
                            
                            HStack(spacing: 20) {
                                Text(.Profile.following(dataStore.currentUser.followingCount))
                                    .bold()
                                
                                Text(.Profile.followers(dataStore.currentUser.followerCount))
                                    .bold()
                            }
                            .font(.subheadline)
                            .padding(.top, 8)
                        }
                        .padding()
                        
                        Divider()
                        
                        // User's tweets
                        LazyVStack(spacing: 0) {
                            ForEach(dataStore.tweets.filter { $0.author.id == dataStore.currentUser.id }) { tweet in
                                VStack(spacing: 0) {
                                    TweetRowView(
                                        tweet: tweet,
                                        onLike: { dataStore.toggleLike(tweet: tweet) },
                                        onRetweet: { dataStore.toggleRetweet(tweet: tweet) }
                                    )
                                    
                                    Divider()
                                }
                            }
                        }
                    }
                }
                .navigationTitle(.Profile.title)
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label(.Profile.title, systemImage: "person")
            }
            .tag(3)
        }
        .sheet(isPresented: $showingCompose) {
            ComposeTweetView(dataStore: dataStore)
        }
    }
}

#Preview {
    ContentView()
        .environment(\.locale, Locale(identifier: "en"))
}
