//
//  NewCarsCellView.swift
//  FastTrack
//
//  Created by Роман on 27.07.2024.
//

import SwiftUI

struct NewCarsCellView: View {
    @Binding var simpleImage: ImageResource
    @Binding var simpleNameCar: String
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Color.secondColorApp
                .frame(height: 74)
                .cornerRadius(25)
            HStack {
                Rectangle()
                    .frame(width: 1, height: 32)
                    .foregroundStyle(.gray)
                CustomTextFieldView(placeholder: "Car title", text: $simpleNameCar)
            } .padding(.leading, 150)
            PickerCarView(selection: $simpleImage, image: .car1)
              //  .frame(width: 150)
                
                
                   
            
        }
        
    }
}

#Preview {
    NewCarsCellView(simpleImage: .constant(.car1), simpleNameCar: .constant(""))
}
