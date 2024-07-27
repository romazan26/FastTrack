//
//  WorkersView.swift
//  FastTrack
//
//  Created by Роман on 27.07.2024.
//

import SwiftUI

struct WorkersView: View {
    var body: some View {
        ZStack {
            Color.secondColorApp
            HStack {
                //MARK: - No workers
                HStack {
                    Circle().frame(width: 54)
                        .overlay {
                            Circle()
                            .stroke(.secondColorApp.opacity(0.5), lineWidth: 4.0)
                        }
                    Circle().frame(width: 54)
                        .overlay {
                            Circle()
                            .stroke(.secondColorApp.opacity(0.5), lineWidth: 4.0)
                        }
                        .offset(x: -30)
                    Circle().frame(width: 54)
                        .overlay {
                            Circle()
                            .stroke(.secondColorApp.opacity(0.5), lineWidth: 4.0)
                        }
                        .offset(x: -60)
                }.foregroundStyle(.mainColorApp)
                
                //MARK: - Count of workers
                Text("0 workers")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .heavy))
                    .offset(x: -40)
                
                Spacer()
                
                Image(systemName: "chevron.right.circle.fill")
                    .resizable()
                    .foregroundStyle(.orangeApp)
                    .frame(width: 29, height: 29)
            }.padding()
        }
        .frame(height: 82)
        .cornerRadius(41)
    }
}

#Preview {
    WorkersView()
}
