//
//  ImageClassifierScreen.swift
//  DZ№8
//
//  Created by Egor Malyshev on 27.12.2021.
//

import SwiftUI

struct ImageClassifierScreen: View {
    
    @StateObject var viewModel: ImageClassifierViewModel = .init()
    
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var dialogIsPresented: Bool = false
    @State var pickerIsPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("CoreML model can classify dogs, cats, trees and mice")
                .multilineTextAlignment(.center)
            Image(uiImage: viewModel.image)
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
            Text(viewModel.text)
            Button("Select image") {
                dialogIsPresented = true
            }
            .confirmationDialog("Select source", isPresented: $dialogIsPresented) {
                Button("Camera") {
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        sourceType = .camera
                        pickerIsPresented = true
                    }
                }
                Button("Photo library") {
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                        sourceType = .photoLibrary
                        pickerIsPresented = true
                    }
                }
            }
        }
        .padding()
        .sheet(isPresented: $pickerIsPresented) {
            ImagePicker(sourceType: sourceType, selectedImage: $viewModel.image)
        }
        
    }
}

struct ImageClassifierScreen_Previews: PreviewProvider {
    static var previews: some View {
        ImageClassifierScreen()
    }
}
