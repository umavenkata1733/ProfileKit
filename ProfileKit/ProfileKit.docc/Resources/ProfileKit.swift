//
//  ProfileKit.swift
//  
//
//  Created by Anand on 1/11/25.
//

// Sources/ProfileKit/ProfileView.swift
import SwiftUI
import NavigationKit

public struct ProfileView: View {
    @EnvironmentObject private var navigationState: NavigationState<AppRoute>
    
    public init() {}
    
    public var body: some View {
        List {
            Button("Edit Profile") {
                navigationState.navigate(to: .editProfile)
            }
            
            Button("Show Action Sheet") {
                navigationState.showActionSheet(
                    title: "Actions",
                    buttons: [
                        ActionSheetButton(title: "Log Out", role: .destructive) {
                            // Handle logout
                        },
                        ActionSheetButton(title: "Cancel", role: .cancel) {}
                    ]
                )
            }
        }
        .navigationTitle("Profile")
    }
}

// Sources/ProfileKit/EditProfileView.swift
import SwiftUI
import NavigationKit

public struct EditProfileView: View {
    @EnvironmentObject private var navigationState: NavigationState<AppRoute>
    @State private var name = "John Doe"
    @State private var email = "john@example.com"
    @State private var bio = "iOS Developer"
    
    public init() {}
    
    public var body: some View {
        Form {
            Section("Personal Info") {
                TextField("Name", text: $name)
                TextField("Email", text: $email)
                TextField("Bio", text: $bio)
            }
            
            Section {
                Button("Save Changes") {
                    navigationState.showAlert(
                        title: "Success",
                        message: "Profile updated successfully!",
                        primaryButton: AlertButton(
                            title: "OK",
                            action: { navigationState.dismiss() }
                        )
                    )
                }
                
                Button("Cancel", role: .destructive) {
                    navigationState.dismiss()
                }
            }
        }
        .navigationTitle("Edit Profile")
    }
}
