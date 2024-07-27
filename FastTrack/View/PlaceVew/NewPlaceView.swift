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
                ScrollView{
                    //MARK: - Place title TF
                    CustomTextFieldView(placeholder: "Place title", text: $vm.simplePlaceTitle)
                        .padding(.top)
                        .focused($keyboardIsFocus)
                    
                    //MARK: - Address TF
                    CustomTextFieldView(placeholder: "Address", text: $vm.simpleAdress)
                        .focused($keyboardIsFocus)
                    
                    //MARK: - Cars List TF
                    ForEach(0..<vm.countCars, id: \.self){i in
                        NewCarsCellView(simpleImage: $vm.simpleCarImage, simpleNameCar: $vm.simpleCarTitleArray[i])
                        
                    }
                    
                    Button(action: {
                        vm.addNewCarCell()
                    }
                    , label: {
                        ZStack {
                            Color.clear
                            Text("+").foregroundStyle(.white)
                        }
                    })
                    .frame(width: 356, height: 63)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.white.opacity(0.3), lineWidth: 2)
                    }
                }
                Spacer()
                
                //MARK: - Create button
                Button(action: {
                    vm.isPresentNewPlace.toggle()
                    vm.addPlace()
                }, label: {
                    OrangeButtonView(text: "Create")
                })
            }
            .padding()
        }
        .onTapGesture {
            keyboardIsFocus = false
        }
    }
}

#Preview {
    NewPlaceView(vm: PlaceViewModel())
}
