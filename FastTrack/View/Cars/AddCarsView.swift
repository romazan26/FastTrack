//
//  AddCarsView.swift
//  FastTrack
//
//  Created by Роман on 29.07.2024.
//

import SwiftUI

struct AddCarsView: View {
    let place: Place
    @StateObject var vm: PlaceViewModel
    var body: some View {
        ZStack {
            Color.mainColorApp.ignoresSafeArea()
            VStack {
                ScrollView {
                    
                    //MARK: - Car list
                    if let cars = place.car?.allObjects as? [Car]{
                        ForEach(cars) { car in
                            CarCellView(car: car, vm: vm)
                        }
                        //MARK: - Cars List TF
                        ForEach(0..<vm.countCars, id: \.self){i in
                            NewCarsCellView(simpleImage: $vm.simpleCarImageArray[i], simpleNameCar: $vm.simpleCars[i])
                            
                        }
                        
                        //MARK: - one more car tF Button
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
                    
                    //MARK: - Save button
                    Button(action: {
                        vm.updateCars(id: place.id)
                        vm.isPresentAddCars.toggle()
                    }, label: {
                        OrangeButtonView(text: "save")
                    })
                }
                
                
            }.padding()
        }
    }
}

#Preview {
    AddCarsView(place: Place(), vm: PlaceViewModel())
}
