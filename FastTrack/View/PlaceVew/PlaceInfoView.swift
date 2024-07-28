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
                
                toolbarView(vm: vm)
                    .padding(.top, 65)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 20)
                
                //MARK: - Count cars
                HStack{
                    Text("Cars")
                        .foregroundStyle(.white)
                        .font(.system(size: 21, weight: .heavy))
                    Text("13")
                        .foregroundStyle(.gray)
                        .font(.system(size: 21, weight: .heavy))
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("See all")
                            .foregroundStyle(.gray)
                            .font(.system(size: 15))
                    })
                    
                }.padding(.top)
                
                //MARK: - List of car
                if let cars = place.car?.allObjects as? [Car] {
                    ScrollView {
                        ForEach(cars) { car in
                            CarCellView(car: car)
                        }
                    }
                }
                
                
                Spacer()
                
                //MARK: - Workers view
                WorkersView()
                    .padding(.vertical)
                
                //MARK: - Edit information button
                Button(action: {}, label: {
                    OrangeButtonView(text: "Edit information")
                })
            }.padding()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PlaceInfoView(vm: PlaceViewModel(), place: Place())
}
