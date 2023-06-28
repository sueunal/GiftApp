//
//  LoginViewModel.swift
//  What'sGift
//
//  Created by sueun kim on 2023/06/28.
//
import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?

    @Published var LoginViewState : Bool = false
    init() {
        
    }
    
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            print(user.uid)
        }
    }
    func loginProcess(email : String, password : String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("Error : \(error.localizedDescription)")
                return
            }else {
                guard let user = result?.user else { return }
                debugPrint("로그인에 성공 하였습니다")
                self.userSession = user
                DispatchQueue.main.async {
                    self.LoginViewState = true
                }
            }
        }
    }
}
