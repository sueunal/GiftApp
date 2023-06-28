//
//  LoginView.swift
//  What'sGift
//
//  Created by sueun kim on 2023/06/28.
//

import SwiftUI

struct RegisterView: View {
        @State var email = ""
        @State var pw = ""
        @State var showMain : Bool = false
        @ObservedObject var viewModel = AuthViewModel()
        
        var body: some View {
            NavigationStack{
                VStack(spacing:20){
                    Text("회원가입")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top,100)
                    Spacer()
                    HStack{
                        Text("이메일")
                            .bold()
                        Spacer()
                    }
                    InputField()
                    HStack{
                        Text("비밀번호")
                            .bold()
                        Spacer()
                    }
                    SecuField()
                    ActionRegister()
                    Spacer()
                }.navigationDestination(isPresented: $showMain) {
                    LoginView()
                        .navigationBarHidden(true)
                }.padding()
            }
        }
        @ViewBuilder
        func InputField()-> some View{
            TextField("Email", text: $email)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .fill(.linearGradient(colors:[.red,.green,.blue], startPoint: .bottomLeading, endPoint: .topTrailing))
                )
        }
        @ViewBuilder
        func SecuField() -> some View{
            SecureField("PW", text: $pw)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .fill(.linearGradient(colors:[.red,.green,.blue], startPoint: .bottomLeading, endPoint: .topTrailing))
                )
        }
        @ViewBuilder
        func ActionRegister()-> some View{
            Button {
               // viewModel.registerUser(email: email, password: pw)
                viewModel.registerUser(email: email, password: pw)
            } label: {
                Text("회원가입")
                    .frame(width: 350,height: 60)
                    .foregroundColor(.white)
                    .font(.title2)
                    .background(.gray)
                    .cornerRadius(10)
                    .padding()
            }.onChange(of: viewModel.LoginViewState) { _ in
                if viewModel.LoginViewState { // loginStatus가 변경됐을 때
                    showMain.toggle()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
