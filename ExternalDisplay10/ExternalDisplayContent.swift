//
//  ExternalDisplayContent.swift
//  ExternalDisplay10
//
//  Created by cmStudent on 2023/06/07.
//

import Foundation

// 外部ディスプレイのviewと端末のviewで情報を繋ぐためのObservavleObject
class ExternalDisplayContent: ObservableObject {
    // 外部ディスプレイを表示しているか判定
    @Published var isShowingOnExternalDisplay = false
    @Published var shapes: [String?] = []
    @Published var shapeTotalWidth = CGFloat(0)
    @Published var shapeTotalHeight = CGFloat(0)
    @Published var x = CGFloat(0)
    @Published var y = CGFloat(0)
    @Published var screenWidth = 0.0
    @Published var screenHeight = 0.0
    @Published var tapCount = 0
}

extension ExternalDisplayContent {
    // MARK: - Methods
    ///折り返すときに呼ばれる
    func offsetShapes() {
        if tapCount != 0 && screenWidth < shapeTotalWidth {
            print("true")
            print(screenWidth)
            print(shapeTotalWidth)
            
            shapeTotalWidth = 100
            shapeTotalHeight += 100
            if shapeTotalHeight > screenHeight {
                x = 0
                y = 0
                shapeTotalHeight = 0
                tapCount = 0
            } else {
                x = 0
                y += 100
            }
        }
    }
    
    func offsetShapesGreatestValue() {
        if screenWidth < shapeTotalWidth && screenHeight < shapeTotalHeight {
            
        }
    }
}
