//
//  OrangeButtonView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct OrangeButtonView: View {
    var text = "Create new place"
    var body: some View {
        ZStack {
            Color.orangeApp
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 19, weight: .heavy))
        }
        .frame(height: 71)
        .cornerRadius(39)
    }
}

#Preview {
    OrangeButtonView()
}
