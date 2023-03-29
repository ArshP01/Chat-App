//
//  RootView.swift
//  Chat App
//
//  Created by Arsh on 29/03/23.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .contacts
    
    var body: some View {
        VStack {
            
            Text("Hello, world!").padding()
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
