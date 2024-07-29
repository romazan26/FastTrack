//
//  PlacesView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct PlacesView: View {
    @StateObject var vm = PlaceViewModel()
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
                        Text("admin")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .heavy))
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(Color.orangeApp)
                            .cornerRadius(88)
                    }
                    .padding(.vertical)
                    //MARK: - ToolBar
                    toolbarView(vm: vm)
                    
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
                                    PlaceCellView(place: place)
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
            
            .sheet(isPresented: $vm.isPresentNewPlace, content: {
                NewPlaceView(vm: vm)
        })
        }
    }
}

#Preview {
    PlacesView()
}
