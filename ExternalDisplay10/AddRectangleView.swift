//
//  ContentView.swift
//  ExternalDisplay10
//
//  Created by cmStudent on 2023/05/24.
//

import SwiftUI

// ディスプレイの画面を取得してスマホ側で追加ボタンを押したらRectangleがディスプレイの左上から追加される。ボタンを押すたびにRectangleは追加されていき画面幅に収まりきらなくなるので画面幅に応じて改行されてまた追加されていく。
// 時間があればRectangleの種類を変更できるのとログイン機能を追加したい。ログイン機能に関しては、ログインしていないときは、ディスプレイ側では、「ログインしてください」と表示されるようにする

// 端末のview
struct AddRectangleView: View {
    // MARK: - Property Wrappers
    @State private var shape: String? = nil
    @EnvironmentObject var externalDisplayContent: ExternalDisplayContent
    // MARK: - body
    var body: some View {
        VStack {
            Spacer()
            Button {
                if !( externalDisplayContent.screenHeight < externalDisplayContent.shapeTotalHeight) {
                    shape = "circle"
                    externalDisplayContent.shapes.append(shape)
                    externalDisplayContent.shapeTotalWidth += AppConst.NumericalValue.width
                    if externalDisplayContent.tapCount == 0 {
                        externalDisplayContent.x = AppConst.NumericalValue.resetValue
                    } else {
                        externalDisplayContent.x += AppConst.NumericalValue.width
                    }
                    externalDisplayContent.offsetShapes()
                    externalDisplayContent.tapCount += 1
                }
            } label: {
                Text("circleを追加")
            }
            
            Button {
                shape = "rectangle"
                externalDisplayContent.shapes.append(shape)
            } label: {
                Text("rectangleを追加")
            }
            Spacer()
        }
    } // body
} // view

//// 端末のview
//struct ContentView: View {
//    @EnvironmentObject var externalDisplayContent: ExternalDisplayContent
//    var body: some View {
//        VStack {
//            GeometryReader { proxy in
//
//                Text("width:\(proxy.size.width), height:\(proxy.size.height)")
//
//                Spacer()
//
//                if externalDisplayContent.isShowingOnExternalDisplay {
//                    Text("接続済み")
//                } else {
//                    Text("切断している")
//                }
//            }
//
//
//        }
//    }
//}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddRectangleView()
    }
}
