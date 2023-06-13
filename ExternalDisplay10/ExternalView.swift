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
        ZStack {
            Color.customColorGray
                .ignoresSafeArea(.all)
            GeometryReader { proxy in
                    ForEach(externalDisplayContent.shapes, id: \.self) { shape in
                        if proxy.size.width > externalDisplayContent.shapeTotalWidth {
                            if shape == "circle" {
                                Circle()
                                    .frame(width: AppConst.NumericalValue.width, height: AppConst.NumericalValue.height)
                                    .foregroundColor(Color.customColorGreen)
                                    .offset(x: externalDisplayContent.x, y: externalDisplayContent.y)
                            } else if shape == "rectangle" {
                                a()
                                Rectangle()
                                    .frame(width: AppConst.NumericalValue.width, height: AppConst.NumericalValue.height)
                                    .cornerRadius(10)
                                    .foregroundColor(Color.customColorGreen)
                                    .offset(x: externalDisplayContent.x, y: externalDisplayContent.y)
                            }
                        }
                    }
                    .onAppear {
                        print("画面サイズ格納\(proxy.size.width)")
                        externalDisplayContent.screenWidth = proxy.size.width
                        externalDisplayContent.screenHeight = proxy.size.height
                    }
            }
        }
    } // body
    func a() -> some View {
        print("rectangle")
        return Text("")
    }
} // view

// MARK: - Preview
struct ExternalView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalView()
    }
}
