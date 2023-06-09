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
//            if externalDisplayContent.isRectangle {
//                Rectangle()
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(50)
//                    .ignoresSafeArea()
//                    .onAppear {
//                        sleep(4)
//                        self.externalDisplayContent.isRectangle.toggle()
//                    }
//            } else {
//                Text("ない")
//            }
        }
    } // body
} // view

// MARK: - Preview
struct ExternalView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalView()
    }
}
