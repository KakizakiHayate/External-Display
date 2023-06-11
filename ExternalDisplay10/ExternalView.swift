//
//  ExternalView.swift
//  ExternalDisplay10
//
//  Created by cmStudent on 2023/05/24.
//

//if externalDisplayContent.isShowingOnExternalDisplay {
//    Text("接続済み")
//} else {
//    Text("切断している")
//}

import SwiftUI

// 外部ディスプレイに表示するためのview
struct ExternalView: View {
    // MARK: - Property Wrappers
    @EnvironmentObject var externalDisplayContent: ExternalDisplayContent
    // MARK: - body
    var body: some View {
        GeometryReader { proxy in
                ForEach(externalDisplayContent.shapes, id: \.self) { shape in
                    if proxy.size.width > externalDisplayContent.shapeTotalWidth {
                        if shape == "circle" {
                            Circle()
                                .frame(width: 100, height: 100)
                                .offset(x: externalDisplayContent.x, y: externalDisplayContent.y)
                        } else if shape == "rectangle" {
                            Rectangle()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                .onAppear {
                    print("画面サイズ格納\(proxy.size.width)")
                    externalDisplayContent.screenWidth = proxy.size.width
                    externalDisplayContent.screenHeight = proxy.size.height
                }
        }
    } // body
} // view

// MARK: - Preview
struct ExternalView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalView()
    }
}
