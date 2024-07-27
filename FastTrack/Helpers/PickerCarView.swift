//
//  PickerGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 30.06.2024.
//

import SwiftUI

struct PickerCarView: View {
    var maxWidth: CGFloat = 150
    var cornerRadius: CGFloat = 15
    @Binding var selection: ImageResource
    @State var image: ImageResource
    @State private var showOptions = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            HStack(spacing: 0) {
                if showOptions {Optionsview()}else{
                    HStack(spacing: 10) {
                        Image(image)
                            .resizable()
                            .frame(width: 72, height: 17)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
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
                }
                
            }
            .background {
                Color.secondColorApp
                    .cornerRadius(18)
            }
            
        }.frame(width: maxWidth, height: 74)
        
    }
    
    @ViewBuilder
    func Optionsview() -> some View {
        HStack(spacing: 10){
            ForEach(Cars.allCases) {  car in
                
                    Image(car.image)
                        .resizable()
                        .frame(width: 72, height: 17)
                   
                
               // .foregroundStyle(selection == car.image ? Color.white : Color.gray)
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
           
        }.frame(height: 74)
        .padding(.horizontal)
        
    }
}

#Preview {
    PickerCarView(selection: .constant(.car1), image: .car1)
}
