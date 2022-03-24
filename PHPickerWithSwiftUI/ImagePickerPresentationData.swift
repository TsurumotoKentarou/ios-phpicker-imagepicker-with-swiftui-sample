//
//  ImagePickerPresentationData.swift
//  PHPickerWithSwiftUI
//
//  Created by 鶴本賢太朗 on 2021/04/02.
//

import SwiftUI

struct ImagePickerPresentationData: Identifiable {
    enum Presentation: View {
        // ImagePicker
        case camera(image: Binding<UIImage?>, onDismiss: () -> Void)
        
        // PHPicker
        case phpicker(pickedImages: Binding<[UIImage]>, selectionLimit: Int, onDismiss: () -> Void)
        
        var body: some View {
            switch self {
            case .camera(let image, let onDismiss):
                return AnyView(CameraPicker(image: image, onDismiss: onDismiss))
                
            case .phpicker(let pickedImages, let selectionLimit, let onDismiss):
                return AnyView(PHPickerRepresentable(selectionLimit: selectionLimit, pickedImages: pickedImages, onDismiss: onDismiss))
            }
        }
    }
    
    var id: String = UUID().uuidString
    
    var presentation: Presentation?
    
    init(presentation: Presentation?) {
        self.presentation = presentation
    }
}
