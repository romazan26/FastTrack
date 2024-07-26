//
//  CustomTextFieldView.swift
//  FastTrack
//
//  Created by Роман on 24.07.2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.secondColorApp
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 15))
            }
            TextField("", text: $text)
                .padding()
                .foregroundStyle(.white)
        }
        .cornerRadius(25)
        .frame(maxWidth: .infinity)
        .frame(height: 74)
    }
}

#Preview {
    CustomTextFieldView( text: .constant(""))
}
