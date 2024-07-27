//
//  CarCellView.swift
//  FastTrack
//
//  Created by Роман on 27.07.2024.
//

import SwiftUI

struct CarCellView: View {
    var body: some View {
        ZStack {
            Color.secondColorApp
            HStack {
                Image(.car1)
                    .resizable()
                    .frame(width: 72, height: 17)
                Rectangle()
                    .frame(width: 1, height: 32)
                    .foregroundStyle(.gray)
                Text("Even PRO V4")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .heavy))
                
                Spacer()
                
                Image(systemName: "chevron.right.circle.fill")
                    .resizable()
                    .foregroundStyle(.orangeApp)
                    .frame(width: 29, height: 29)
            }.padding()
        }
        .frame(height: 74)
        .cornerRadius(25)
    }
}

#Preview {
    CarCellView()
}
