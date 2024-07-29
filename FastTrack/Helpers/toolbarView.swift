//
//  toolbarView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct toolbarView: View {
    
    @StateObject var vm: PlaceViewModel
    
    var totalWorker = 0
    var salary = 0
    
    var body: some View {
        ZStack {
            Color.secondColorApp
            HStack(spacing: 18) {
                //MARK: - Total salary
                VStack {
                    Text("\(salary)$")
                        .foregroundStyle(.white)
                    .font(.system(size: 26,weight: .heavy))
                    Text("Total salary")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                }
                
                Rectangle()
                    .frame(width: 1, height: 29)
                    .foregroundColor(.gray)
                
                //MARK: - Total workers
                VStack {
                    Text("\(totalWorker)")
                        .foregroundStyle(.white)
                    .font(.system(size: 26,weight: .heavy))
                    Text("Total workers")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                }
                
                Rectangle()
                    .frame(width: 1, height: 29)
                    .foregroundColor(.gray)
                
                //MARK: - Total places
                VStack {
                    Text("\(vm.places.count)")
                        .foregroundStyle(.white)
                    .font(.system(size: 26,weight: .heavy))
                    Text("Total places")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                }
            }
        }
        .frame( height: 85)
        .cornerRadius(32)
    }
}

#Preview {
    toolbarView(vm: PlaceViewModel())
}
