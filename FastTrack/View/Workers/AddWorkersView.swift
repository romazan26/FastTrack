//
//  AddWorkersView.swift
//  FastTrack
//
//  Created by Роман on 29.07.2024.
//

import SwiftUI

struct AddWorkersView: View {
    var body: some View {
        ZStack {
            Color.mainColorApp.ignoresSafeArea()
            VStack {
                //MARK: - Toll bar
                HStack {
                    
                    //MARK: - Back button
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .foregroundStyle(.orangeApp)
                            .frame(width: 29, height: 29)
                    })
                    
                    Spacer()
                    
                    //MARK: - Label View
                    Text("Workers")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    //MARK: - Count of workers
                    ZStack{
                        Circle()
                            .frame(width: 38)
                            .foregroundStyle(.secondColorApp)
                        Text("0")
                            .foregroundStyle(.white)
                            .font(.system(size: 19, weight: .heavy))
                    }
                }
                
                //MARK: - Total per workers
                ZStack{
                    Color.secondColorApp
                    VStack{
                        Text("0$")
                            .foregroundStyle(.white)
                            .font(.system(size: 31, weight: .heavy))
                        Text("Total per workers")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                    }
                }
                .frame(height: 85)
                .cornerRadius(32)
                Spacer()
                
            }.padding()
        }
    }
}

#Preview {
    AddWorkersView()
}
