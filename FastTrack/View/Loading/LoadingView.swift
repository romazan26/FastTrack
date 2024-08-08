//
//  LoadingVew.swift
//  FastTrack
//
//  Created by Роман on 24.07.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var percents: Float = 0
    @State private var isPresentGame = false
    var body: some View {
            ZStack {
                Color.mainColorApp.ignoresSafeArea()
                VStack {
                    //MARK: - Title
                    Text("FastTrack")
                        .foregroundStyle(.white)
                        .font(.system(size: 54, weight: .heavy))
                        .padding(.top, 165)
                    
                    //MARK: - user name
                    Text("admin")
                        .foregroundStyle(.white)
                        .font(.system(size: 19, weight: .heavy))
                        .padding(5)
                        .background(Color.orangeApp)
                        .cornerRadius(87)
                        .padding(.top, -30)
                    
                    Spacer()
                    
                    //MARK: - Loading circle
                    
                    ProgressCircleView(progress: percents)
                        .frame(width: 100, height: 100)
                }.padding()
            }.onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                    if percents < 0.99{
                        percents += 0.01
                    }else {
                        timer.invalidate()
                        isPresentGame = true}
                }
            })
            .fullScreenCover(isPresented: $isPresentGame, content: {
                Registrationview()
            })
    }
    
}

#Preview {
    LoadingView()
}
