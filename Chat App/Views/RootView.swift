//
//  RootView.swift
//  Chat App
//
//  Created by Arsh on 29/03/23.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .contacts
    
    @State var isOnboarding = !AuthViewModel.isUserLoggedIn()
    
    var body: some View {
        
        ZStack {
            
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                
                switch selectedTab {
                    
                case .chats:
                    ChatsListView()
                case .contacts:
                    ContactsListView()
                }
                
                Spacer()
                
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        
        .fullScreenCover(isPresented: $isOnboarding) {
            //on dismiss
        } content: {
            //The onboarding sequence
            OnboardingContainerView(isOnboarding: $isOnboarding)
        }
        
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
