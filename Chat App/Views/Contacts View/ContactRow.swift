//
//  ContactRow.swift
//  Chat App
//
//  Created by Arsh on 04/04/23.
//

import SwiftUI

struct ContactRow: View {
    
    var user: User
    
    var body: some View {
        
        HStack(spacing: 24) {
            
            // Profile Image
            ZStack {
                
                // Check if user has a photo set
                if user.photo == nil {
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                        
                        Text(user.firstname?.prefix(1) ?? "")
                            .bold()
                    }
                    
                }
                else {
                    
                    // Create URL form user photo url
                    let photoUrl = URL(string: user.photo ?? "")
                    
                    // Profile image
                    AsyncImage(url: photoUrl) { phase in
                        
                        switch phase {
                            
                        case .empty:
                            // Currently fetching
                            ProgressView()
                            
                        case .success(let image):
                            // Display the fetched image
                            image
                                .resizable()
                                .clipShape(Circle())
                                .scaledToFill()
                                .clipped()
                            
                        case .failure:
                            // Couldn't fetch profile picture
                            // Display circle with first letter of first name
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                
                                Text(user.firstname?.prefix(1) ?? "")
                                    .bold()
                            }
                            
                        }
                    }
                }
                
                
                
                // Blue border
                Circle()
                    .stroke(Color("create-profile-border"), lineWidth: 2)
            }
            .frame(width: 44, height: 44)
            
            VStack (alignment: .leading, spacing: 4){
                // Name
                Text("\(user.firstname ?? "") \(user.lastname ?? "")")
                    .font(Font.button)
                    .foregroundColor(Color("text-primary"))
                
                // Phone number
                Text(user.phone ?? "")
                    .font(Font.bodyParagraph)
                    .foregroundColor(Color("text-input"))
            }
            // Extra space
            Spacer()
        }
        
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(user: User())
    }
}