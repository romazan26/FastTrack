//
//  PickerGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 30.06.2024.
//

import SwiftUI

struct PickerCarView: View {
    var maxWidth: CGFloat = 180
    var cornerRadius: CGFloat = 15
    @Binding var selection: ImageResource
    @State var image: ImageResource
    @State private var showOptions = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    Image(image)
                        .resizable()
                        .frame(width: 72, height: 17)
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: showOptions ? -100 : 0))
                    
                }
                .padding(.horizontal, 15)
                .frame(width: size.width, height: size.height)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        showOptions.toggle()
                    }
                }
                if showOptions {Optionsview()}
            }
            .background {
                Color.secondColorApp
                    .cornerRadius(18)
            }
            
        }.frame(width: maxWidth, height: 74)
        
    }
    
    @ViewBuilder
    func Optionsview() -> some View {
        VStack(spacing: 10){
            ForEach(Cars.allCases) {  car in
                HStack(spacing: 0) {
                    Image(car.image)
                        .resizable()
                        .frame(width: 72, height: 17)
                    Spacer()
                    Image(systemName: "checkmark")
                        .foregroundStyle(.white)
                        .opacity(selection == car.image ? 1: 0)
                }
                .foregroundStyle(selection == car.image ? Color.white : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = car.image
                        image = car.image
                        showOptions = false
                    }
                }
            }
           
            
        }
        .padding(.horizontal, 15)
        
    }
}

#Preview {
    PickerCarView(selection: .constant(.car1), image: .car1)
}
