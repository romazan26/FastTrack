//
//  LoadingVew.swift
//  FastTrack
//
//  Created by Роман on 24.07.2024.
//

import SwiftUI

struct LoadingView: View {
    @StateObject var vm = RegistrationViewModel()
    var body: some View {
        if vm.users.isEmpty {
            Registrationview(vm: vm)
        }else{
            ZStack {
                Color.mainColorApp.ignoresSafeArea()
                VStack {
                    //MARK: - Title
                    Text("FastTrack")
                        .foregroundStyle(.white)
                        .font(.system(size: 54, weight: .heavy))
                        .padding(.top, 180)
                    
                    //MARK: - user name
                    Text(vm.users.first?.name ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 19, weight: .heavy))
                        .padding(5)
                        .background(Color.orangeApp)
                        .cornerRadius(87)
                        .padding(.top, -30)
                    
                    Spacer()
                    
                    //MARK: - Loading circle
                    
                    ProgressCircleView(progress: vm.percents)
                        .frame(width: 100, height: 100)
                }.padding()
            }.onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                    if vm.percents < 0.99{
                        vm.percents += 0.01
                    }else {
                        timer.invalidate()
                        vm.isPresentGame = true}
                }
            })
            .fullScreenCover(isPresented: $vm.isPresentGame, content: {
                PlacesView()
            })
    }
    }
}

#Preview {
    LoadingView()
}
