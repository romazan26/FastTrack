//
//  PlaceInfoView.swift
//  FastTrack
//
//  Created by Роман on 27.07.2024.
//

import SwiftUI

struct PlaceInfoView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: PlaceViewModel
    let place: Place
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            //MARK: - background
            Color.mainColorApp.ignoresSafeArea()
            
            //MARK: - Title image
            Image(.placeTitle)
                .resizable()
                .frame(height: 211)
                .ignoresSafeArea()
            
            //MARK: - Main stack
            VStack {
                HStack{
                    //MARK: - Back button
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 29, height: 29)
                            .foregroundStyle(.orangeApp)
                    })
                    Text(place.placetitle ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    Text(place.adress ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .heavy))
                        .padding(6)
                        .background(Color.secondColorApp.cornerRadius(91))
                }
                if let workers = place.worker?.allObjects as? [Worker]{
                    toolbarView(vm: vm, totalWorker: workers.count, salary: Int(place.salary))
                        .padding(.top, 65)
                        .shadow(color: .black, radius: 20)
                }
                
                //MARK: - Count cars
                HStack{
                    
                    Text("Cars")
                        .foregroundStyle(.white)
                        .font(.system(size: 21, weight: .heavy))
                    if let cars = place.car?.allObjects as? [Car]{
                        Text("\(cars.count)")
                            .foregroundStyle(.gray)
                            .font(.system(size: 21, weight: .heavy))
                    }
                    Spacer()
                    
                    Button(action: {vm.isPresentAllCars.toggle()}, label: {
                        Text("See all")
                            .foregroundStyle(.gray)
                            .font(.system(size: 15))
                    })
                    
                }.padding(.top)
                
                //MARK: - List of car
                if let cars = place.car?.allObjects as? [Car] {
                    ScrollView {
                        ForEach(cars.prefix(3)) { car in
                            CarCellView(car: car, vm: vm)
                        }
                    }
                }
                
                Spacer()
                
                //MARK: - Workers view
                Button(action: {vm.isPresentEditeWorkers.toggle()}, label: {
                    WorkersCellView(place: place)
                        .padding(.vertical)
                })
                
                
                //MARK: - Edit information button
                Button(action: {
                    vm.updatePlaceSolary(id: place.id)
                    vm.addAllWorkers(place: place)
                    dismiss()
                }, label: {
                    OrangeButtonView(text: "Edit information")
                })
            }.padding()
        }
        .onAppear(perform: {
            vm.getPlace()
        })
        .sheet(isPresented: $vm.isPresentEditeWorkers, content: {
            AddWorkersView(place: place, vm: vm)
        })
        .sheet(isPresented: $vm.isPresentAllCars, content: {
            AllCarsView(place: place, vm: vm)
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PlaceInfoView(vm: PlaceViewModel(), place: Place())
}
