//
//  Registrationview.swift
//  FastTrack
//
//  Created by Роман on 24.07.2024.
//

import SwiftUI

struct Registrationview: View {
    @StateObject var vm = RegistrationViewModel()
    @FocusState private var keyboardIsFocus: Bool
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.mainColorApp.ignoresSafeArea()
            VStack {
                //MARK: - title
                Text("Registration")
                    .foregroundStyle(.white)
                    .font(.system(size: 37, weight: .heavy))
                    .padding(.vertical)
                
                //MARK: - Name text field
                CustomTextFieldView(placeholder: "Name", text: $vm.simpleName)
                    .padding(.top)
                    .focused($keyboardIsFocus)
                
                //MARK: - Surname text field
                CustomTextFieldView(placeholder: "Sername", text: $vm.simpleSurname)
                    .focused($keyboardIsFocus)
                
                Spacer()
                //MARK: - Begin button
                Button(action: {
                    vm.addUser()
                    vm.isPresentGame.toggle()}, label: {
                    CustomButtonView(text: "Begin")
                        .opacity(vm.simpleName.isEmpty ? 0.5 : 1)
                })
                .disabled(vm.simpleName.isEmpty ? true : false)
                
                //MARK: - Skip button
                Button(action: { vm.isPresentGame.toggle()}, label: {
                    Text("Skip")
                        .foregroundStyle(.orangeApp)
                        .font(.title2)
                        .opacity(0.8)
                })
                
            }.padding()
        }
        .fullScreenCover(isPresented: $vm.isPresentGame, content: {
            PlacesView( vmUser: vm)
        })
        .onTapGesture {
            keyboardIsFocus = false
        }
    }
}

#Preview {
    Registrationview(vm: RegistrationViewModel())
}
