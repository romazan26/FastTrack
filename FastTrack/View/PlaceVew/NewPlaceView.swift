//
//  NewPlaceView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct NewPlaceView: View {
    @StateObject var vm: PlaceViewModel
    var body: some View {
        ZStack {
            Color.mainColorApp.ignoresSafeArea()
            VStack {
                //MARK: - Toll bar
                HStack {
                    Button(action: {vm.isPresentNewPlace.toggle()}, label: {
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
                
                Spacer()
                
                Button(action: {vm.isPresentNewPlace.toggle()}, label: {
                    OrangeButtonView(text: "Create")
                })
                
            }.padding()
        }
    }
}

#Preview {
    NewPlaceView(vm: PlaceViewModel())
}
