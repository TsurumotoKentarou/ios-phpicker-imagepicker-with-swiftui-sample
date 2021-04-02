//
//  ImageData.swift
//  PHPickerWithSwiftUI
//
//  Created by 鶴本賢太朗 on 2021/04/02.
//

import UIKit

struct ImageData: Identifiable {
    let id: String = UUID().uuidString
    let image: UIImage
}
