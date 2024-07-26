//
//  ProgressCircleView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct ProgressCircleView: View {
    var progress: Float = 0.3
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.2)
                .foregroundStyle(.gray)
            
            Text("\(String(format: "%.0f", progress * 100))%")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .bold))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.orangeApp)
                .rotationEffect(Angle(degrees: 270))
        }.padding()
    }
}

#Preview {
    ProgressCircleView()
}
