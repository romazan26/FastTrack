//
//  PlacesView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct PlacesView: View {
    @StateObject var vm = PlaceViewModel()
    @StateObject var vmUser: RegistrationViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainColorApp.ignoresSafeArea()
                VStack {
                    //MARK: - Title
                    HStack {
                        Text("FastTrack")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .heavy))
                        Spacer()
                        Text(vmUser.users.first?.name ?? "")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .heavy))
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(Color.orangeApp)
                            .cornerRadius(88)
                    }
                    .padding(.vertical)
                    //MARK: - ToolBar
                    
                    toolbarView(vm: vm, totalWorker: vm.workers.count, salary: vm.allSalary)
                    
                    Spacer()
                    
                    //MARK: - Places
                    if vm.places.isEmpty{
                        Text("Empty for now").foregroundStyle(.gray)
                    }else{
                        ScrollView {
                            ForEach(vm.places) { place in
                                NavigationLink {
                                    PlaceInfoView(vm: vm, place: place)
                                } label: {
                                    PlaceCellView(place: place, vm: vm)
                                }
                            }
                        }
                        .padding(.vertical)
                    }
                    
                    Spacer()
                    
                    //MARK: - Create new place button
                    Button(action: {vm.isPresentNewPlace.toggle()}, label: {
                        OrangeButtonView(text: "Create new place")
                    })
                }.padding()
            }
            .onAppear(perform: {
                vm.getPlace()
                vm.getAllSalary()
            })
            .sheet(isPresented: $vm.isPresentNewPlace, content: {
                NewPlaceView(vm: vm)
        })
        }
    }
}

#Preview {
    PlacesView( vmUser: RegistrationViewModel())
}
