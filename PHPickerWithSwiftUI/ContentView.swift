//
//  ContentView.swift
//  PHPickerWithSwiftUI
//
//  Created by 鶴本賢太朗 on 2021/04/02.
//

import SwiftUI

struct ContentView: View {
    // PHPickerのfullScreenの固有データ
    @State private var presentation: ImagePickerPresentationData?
    
    // ImagePicker側でbindする画像
    @State private var bindingImagePickerImage: UIImage?
    
    // PHPicker側でbindする画像一覧
    @State private var bindingPhPickerImages: [UIImage] = []
    
    // 表示用の画像データ
    @State private var images: [ImageData] = []
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    presentation = .init(presentation: .phpicker(pickedImages: $bindingPhPickerImages, selectionLimit: 10, onDismiss: {
                        presentation = nil
                        images = bindingPhPickerImages.map({ ImageData(image: $0) })
                    }))
                }, label: {
                    Text("PHPicker")
                })
                
                Button(action: {
                    presentation = ImagePickerPresentationData(presentation: .picker(image: $bindingImagePickerImage, sourceType: .camera, onDismiss: {
                        if let pickedImage: UIImage = bindingImagePickerImage {
                            images = [ImageData(image: pickedImage)]
                        }
                        bindingImagePickerImage = nil
                    }))
                }, label: {
                    Text("ImagePicker")
                })
            }

            .fullScreenCover(item: $presentation) { $0.presentation }
            
            List {
                ForEach(images) { imageData in
                    Image(uiImage: imageData.image)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
