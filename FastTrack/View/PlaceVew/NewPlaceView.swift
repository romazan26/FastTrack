//
//  NewPlaceView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct NewPlaceView: View {
    @StateObject var vm: PlaceViewModel
    @FocusState var keyboardIsFocus: Bool
    var body: some View {
        ZStack {
            Color.mainColorApp.ignoresSafeArea()
            VStack {
                //MARK: - Toll bar
                HStack {
                    Button(action: {
                        vm.isPresentNewPlace.toggle()
                        vm.clear()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .foregroundStyle(.orangeApp)
                            .frame(width: 29, height: 29)
                    })
                    
                    Spacer()
                    
                    Text("New place")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        .padding(.trailing, 20)
                    Spacer()
                }
                
                //MARK: - Text Field group
                CustomTextFieldView(placeholder: "Place title", text: $vm.simplePlaceTitle)
                    .padding(.top)
                    .focused($keyboardIsFocus)
                CustomTextFieldView(placeholder: "Address", text: $vm.simpleAdress)
                    .focused($keyboardIsFocus)
                Spacer()
                
                //MARK: - Create button
                Button(action: {
                    vm.isPresentNewPlace.toggle()
                    vm.addPlace()
                }, label: {
                    OrangeButtonView(text: "Create")
                })
                
            }.padding()
        }
        .onTapGesture {
            keyboardIsFocus = false
        }
    }
}

#Preview {
    NewPlaceView(vm: PlaceViewModel())
}
