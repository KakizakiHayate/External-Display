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
            
            shapeTotalWidth = AppConst.NumericalValue.width
            shapeTotalHeight += AppConst.NumericalValue.height
            if shapeTotalHeight > screenHeight {
                x = AppConst.NumericalValue.resetValue
                y = AppConst.NumericalValue.resetValue
                shapeTotalHeight = AppConst.NumericalValue.resetValue
                tapCount = AppConst.NumericalValue.resetTapCount
            } else {
                x = AppConst.NumericalValue.resetValue
                y += AppConst.NumericalValue.height
            }
        }
    }
}
