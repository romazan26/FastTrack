//
//  TextFieldCustomView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct TextFieldCustomView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color.secondColorApp
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
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
    TextFieldCustomView( text: .constant(""))
}
