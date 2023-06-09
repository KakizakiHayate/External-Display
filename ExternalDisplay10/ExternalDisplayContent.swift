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
    @Published var isRectangle = false
    @Published var rectangleCount = 0
}
