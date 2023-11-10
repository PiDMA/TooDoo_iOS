//
//  AuthViewModel.swift
//  TooDoo
//
//  Created by David Pinto on 2023-11-09.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


//auth protocol

protocol AuthenticationFormProtocol{
    var formIsValid: Bool {get}
}
@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    

    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do{
            print("DEBUG: SIGN IN FROM AUTHVIEWMODEL")
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch{
            print("DEBUG: Failed to long in with error \(error.localizedDescription)")
        }
    }
    
    //async func will try to create a user with firebase. The "result", if successful, will set the user session accordingly, create a local user object,
    //encode it using their codable protocol, then upload to firebase.
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
            print("DEBUG: Creating user \(result.user)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){	
        do{
            print("DEBUG: Signed out")
            try Auth.auth().signOut()   //sign out on backend/firebase
            self.userSession = nil  //wipes current user session
            self.currentUser = nil  //wipes currentß user model
        } catch{
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async{
        print("DEBUG: Fetching User")
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Fetched user with email \(String(describing: currentUser?.email))")
        print("DEBUG: Current user is \(String(describing: self.currentUser))")
    }
}
