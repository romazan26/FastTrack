//
//  NewCarsCellView.swift
//  FastTrack
//
//  Created by Роман on 27.07.2024.
//

import SwiftUI

struct NewCarsCellView: View {
    @Binding var simpleImage: ImageResource
    var body: some View {
        ZStack {
            Color.secondColorApp
            HStack {
                PickerCarView(selection: $simpleImage, image: .car1)
                Rectangle()
                    .frame(width: 1, height: 32)
                    .foregroundStyle(.gray)
                
            }
        }
        .frame(height: 74)
        .cornerRadius(25)
    }
}

#Preview {
    NewCarsCellView(simpleImage: .constant(.car1))
}
