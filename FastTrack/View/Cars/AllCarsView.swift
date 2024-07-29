//
//  AllCarsView.swift
//  FastTrack
//
//  Created by Роман on 29.07.2024.
//

import SwiftUI

struct AllCarsView: View {
    
    let place: Place
    @StateObject var vm: PlaceViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            Color.mainColorApp.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack {
                //MARK: - Toll bar
                HStack {
                    
                    //MARK: - Back button
                    Button(action: {
                        vm.isPresentAllCars.toggle()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .foregroundStyle(.orangeApp)
                            .frame(width: 29, height: 29)
                    })
                    
                    Spacer()
                    
                    //MARK: - Label View
                    Text("Cars")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    //MARK: - Count of cars
                    ZStack{
                        Circle()
                            .frame(width: 38)
                            .foregroundStyle(.secondColorApp)
                        if let cars = place.car?.allObjects as? [Car]{
                            Text("\(cars.count)")
                                .foregroundStyle(.white)
                                .font(.system(size: 19, weight: .heavy))
                        }
                    }
                }
                if let cars = place.car?.allObjects as? [Car]{
                    ScrollView {
                        ForEach(cars) { car in
                            CarCellView(car: car, vm: vm)
                        }
                    }
                }
                Spacer()
            }.padding()
            
            //MARK: - Add car button
            Button(action: {vm.isPresentAddCars.toggle()}, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundStyle(.orangeApp)
                    .frame(width: 68, height: 68)
                    
            }).padding()
           
        }
        .fullScreenCover(isPresented: $vm.isPresentAddCars, content: {
            AddCarsView(place: place, vm: vm)
        })
    }
}

#Preview {
    AllCarsView(place: Place(), vm: PlaceViewModel())
}
