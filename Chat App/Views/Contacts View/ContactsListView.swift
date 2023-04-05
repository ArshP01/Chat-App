//
//  ContactsListView.swift
//  Chat App
//
//  Created by Arsh on 31/03/23.
//

import SwiftUI

struct ContactsListView: View {
    
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    
    @State var filterText = ""
    
    var body: some View {
        
        VStack {
            // Heading
            HStack {
                Text("Contacts")
                    .font(Font.pageTitle)
                Spacer()
                Button {
                    // Settings
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .tint(Color("icons-secondary"))
                }
                
            }
            .padding(.top, 20)
            
            // Search Bar
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                
                TextField("Search contact or number", text: $filterText)
                    .font(Font.tabBar)
                    .foregroundColor(Color("text-textfield"))
                    .padding()
            }
            .frame(height: 46)
            .onChange(of: filterText) { _ in
                // Filter the results
                contactsViewModel.filterContacts(filterBy:
                                                    filterText.lowercased().trimmingCharacters(in:.whitespacesAndNewlines))
            }
            
            if contactsViewModel.filteredUsers.count > 0 {
                
                // List
                List(contactsViewModel.filteredUsers) { user in
                    
                    // Display rows
                    ContactRow(user: user)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
                .padding(.top, 12)
                
                
            }
            else {
                // No Contacts Page
                VStack{
                    Spacer()
                    
                    Image("no-contacts-yet")
                    
                    Text("Hmm... Zero contacts?")
                        .font(Font.chatHeading)
                        .padding(.top, 32)
                    
                    Text("Try saving some contacts on your phone!")
                        .font(Font.bodyParagraph)
                        .padding(.top, 7)
                    
                    Spacer()
                    
                }
                
            }
            
        }
        .padding(.horizontal)
        .onAppear {
            // Get local contacts
            contactsViewModel.getLocalContacts()
        }
        
        
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView()
    }
}
