//
//  PlaceCellView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct PlaceCellView: View {
    let place: Place
    var body: some View {
        ZStack {
            Color.secondColorApp
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        //MARK: - Title place
                        
                        Text(place.placetitle ?? "")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .heavy))
                        
                        
                        
                        
                        //MARK: - Worker
                        HStack{
                            Image(.worker1)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 32, height: 32)
                                .cornerRadius(50)
                            Image(.worker1)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 32, height: 32)
                                .cornerRadius(50)
                                .offset(x: -20)
                            Image(.worker1)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 32, height: 32)
                                .cornerRadius(50)
                                .offset(x: -40)
                        }
                        .foregroundStyle(.grayApp)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 29,height: 29)
                            .foregroundStyle(.orangeApp)
                    }
                    //MARK: - Adress place
                    Text(place.adress ?? "")
                        .foregroundStyle(.white)
                    .font(.system(size: 12, weight: .heavy))
                    .padding(7)
                    .background(Color.grayApp.cornerRadius(63))
                    .padding(.top, -10)
                }
            
        
                Spacer()
                HStack{
                    //MARK: - Cars
                    HStack{
                        Image(.car1)
                            .resizable()
                            .frame(width: 54, height: 13)
                        Text("13 cars")
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .heavy))
                    }
                    .frame(width: 139, height: 57)
                    .background(Color.grayApp.cornerRadius(22))
                    
                    Spacer()
                    
                    //MARK: - Salary
                    VStack{
                        Text("15670$")
                            .foregroundStyle(.white)
                            .font(.system(size: 25, weight: .heavy))
                        Text("July")
                            .foregroundStyle(.gray)
                            .font(.system(size: 12))
                    }
                    .frame(width: 165, height: 57)
                    .background(Color.grayApp.cornerRadius(22))
                }
            }.padding()
        }
        .frame(height: 157)
        .cornerRadius(22)
    }
}

#Preview {
    PlaceCellView(place: Place())
}
