//
//  ContentView.swift
//  SocialSampleApp
//
//  Created by Petr Pavlik on 20.01.2026.
//

import SwiftUI
import Assets
import Tolgee

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
                Label(title: {TolgeeText(.Tweets.title)}, icon: {Image(systemName: "house")})
            }
            .tag(0)
            
            // Search
            NavigationView {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    TolgeeText(.Search.searchPlaceholder)
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                .navigationTitle(.Search.title)
            }
            .tabItem {
                Label(title: {TolgeeText(.Search.title)}, icon: {Image(systemName: "magnifyingglass")})
            }
            .tag(1)
            
            // Notifications
            NavigationView {
                VStack {
                    Image(systemName: "bell")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    TolgeeText(.Notifications.noContent)
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                .navigationTitle(.Notifications.title)
            }
            .tabItem {
                Label(title: {TolgeeText(.Notifications.title)}, icon: {Image(systemName: "bell")})
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
                            TolgeeText(dataStore.currentUser.displayName)
                                .font(.title2)
                                .bold()
                            
                            Text(verbatim: "@\(dataStore.currentUser.username)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            TolgeeText(dataStore.currentUser.bio)
                                .font(.body)
                                .padding(.top, 4)
                            
                            HStack(spacing: 20) {
                                TolgeeText("following %lld", dataStore.currentUser.followingCount, tableName: "Profile")
                                    .bold()
                                
                                TolgeeText("followers %lld", dataStore.currentUser.followerCount, tableName: "Profile")
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
                Label(title: {TolgeeText(.Profile.title)}, icon: {Image(systemName: "person")})
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
        .environment(\.locale, Locale(identifier: "pt"))
}
