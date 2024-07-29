//
//  CarCellView.swift
//  FastTrack
//
//  Created by Роман on 27.07.2024.
//

import SwiftUI

struct CarCellView: View {
    let car: Car
    @StateObject var vm: PlaceViewModel
    var body: some View {
        ZStack {
            Color.secondColorApp
            HStack(spacing: 20) {
                Image(uiImage: car.carImage ?? .car1 )
                    .resizable()
                    .frame(width: 72, height: 17)
                Rectangle()
                    .frame(width: 1, height: 32)
                    .foregroundStyle(.gray)
                Text(car.carTitle ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .heavy))
                
                Spacer()
                
                Button(action: {vm.deleteCar(car: car)}, label: {
                    Image(systemName: "trash.circle")
                        .resizable()
                        .frame(width: 29, height: 29)
                        .foregroundStyle(.orangeApp)
                })
            }.padding()
        }
        .frame(height: 74)
        .cornerRadius(25)
    }
}

#Preview {
    CarCellView(car: Car(), vm: PlaceViewModel())
}
