//
//  AppConst.swift
//  ExternalDisplay10
//
//  Created by 柿崎逸 on 2023/06/11.
//

import Foundation

enum AppConst {
    enum NumericalValue {
        static let width = CGFloat(100)
        static let height = CGFloat(100)
        static let resetValue = CGFloat(0)
        static let resetTapCount = 0
    }
    enum Text {
        /// 図形を選択してください
        static let selectShapes = "図形を選択してください"
        static let confirmation = "確認"
        static let cancel = "キャンセル"
        static let attention = "注意"
        static let ok = "ok"
        static let unchangeableShape = "図形を変更できません"
        static let selectShapeQuestion = "この図形を選択しますか？\n変更できなくなります"
        /// 選択する
        static let selected = "選択する"
        static let buttonTap = "ボタンをタップ！"
    }
}
