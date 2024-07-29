//
//  NewWorkerCellView.swift
//  FastTrack
//
//  Created by Роман on 29.07.2024.
//

import SwiftUI
import PhotosUI

struct NewWorkerCellView: View {
    
    @Binding var nameWorker: String
    @Binding var photoWorker: UIImage
    
    @State private var isPresented: Bool = false
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    var body: some View {
        ZStack {
            Color.secondColorApp
            
            HStack(spacing: 20) {
                
                //MARK: - Photo worker
                if photoWorker == .test{
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(.test)
                            .resizable()
                            .frame(width: 54, height: 54)
                    }
                    .sheet(isPresented: $isPresented, content: {
                        PhotoPicker(configuration: self.config, image: $photoWorker, isPresented: $isPresented)
                    })
                }else{
                    Image(uiImage: photoWorker)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 53, height: 53)
                        .cornerRadius(50)
                }
                
                Rectangle()
                    .frame(width: 1, height: 32)
                    .foregroundStyle(.gray)
                
                //MARK: - Name worker
                CustomTextFieldView(placeholder: "Name Surname", text: $nameWorker)
                    .foregroundStyle(.gray)
                    .font(.system(size: 18))
                
                Spacer()
                
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 29, height: 29)
                    .foregroundStyle(.grayApp)
            }.padding()
        }
        .frame(height: 74)
        .cornerRadius(25)
    }
}

#Preview {
    NewWorkerCellView(nameWorker: .constant(""), photoWorker: .constant(.worker1))
}
