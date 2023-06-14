//
//  ContentView.swift
//  ExternalDisplay10
//
//  Created by cmStudent on 2023/05/24.
//

import SwiftUI

/// 端末のview
struct AddShapesView: View {
    // MARK: - Property Wrappers
    @State private var shape: String? = nil
    @State private var isSelectRectangle = false
    @State private var isSelectCircle = false
    @State private var isChangeLock = false
    @State private var isRectangleAlert = false
    @State private var isCircleAlert = false
    @State private var isChangeLockAlert = false
    @EnvironmentObject var externalDisplayContent: ExternalDisplayContent
    // MARK: - body
    var body: some View {
        ZStack {
            Color.customColorGray
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text(AppConst.Text.selectShapes)
                        .foregroundColor(.white)
                        .bold()
                    HStack {
                        // Rectangleボタン
                        Button {
                            if !isChangeLock {
                                shape = "rectangle"
                                isRectangleAlert.toggle()
                            }
                        } label: {
                            Image(systemName: "square.fill")
                                .foregroundColor(.customColorGreen)
                                .font(.system(size: 70))
                        }
                        .padding()
                        .alert(AppConst.Text.confirmation, isPresented: $isRectangleAlert) {
                            Button {} label: { Text(AppConst.Text.cancel) }
                            Button {
                                isChangeLock = true
                                if isChangeLock {
                                    isSelectRectangle = true
                                    isSelectCircle = false
                                } else {
                                    isChangeLockAlert.toggle()
                                }
                            } label: {
                                Text(AppConst.Text.selected)
                            }
                        } message: {
                            Text(AppConst.Text.selectShapeQuestion)
                        }
                        .alert(AppConst.Text.attention, isPresented: $isChangeLockAlert) {
                            Button {} label: { Text(AppConst.Text.ok) }
                        } message: {
                            Text(AppConst.Text.unchangeableShape)
                        }
                        .background(isSelectRectangle ? Color.customColorYellow.opacity(0.6) : Color.customColorGray)
                        // Circleボタン
                        Button {
                            if !isChangeLock {
                                shape = "circle"
                                isCircleAlert.toggle()
                            } else {
                                isChangeLockAlert.toggle()
                            }
                        } label: {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.customColorGreen)
                                .font(.system(size: 70))
                        }
                        .padding()
                        .alert(AppConst.Text.confirmation, isPresented: $isCircleAlert) {
                            Button {} label: {Text(AppConst.Text.cancel)}
                            Button {
                                isChangeLock = true
                                if isChangeLock {
                                    isSelectCircle = true
                                    isSelectRectangle = false
                                }
                            } label: {
                                Text(AppConst.Text.selected)
                            }
                        } message: {
                            Text(AppConst.Text.selectShapeQuestion)
                        }
                        .alert(AppConst.Text.attention, isPresented: $isChangeLockAlert) {
                            Button {} label: { Text(AppConst.Text.ok) }
                        } message: {
                            Text(AppConst.Text.unchangeableShape)
                        }
                        .background(isSelectCircle ? Color.customColorYellow.opacity(0.6) : Color.customColorGray)
                    }
                }
                .padding()
                Spacer()
                    .frame(height: 100)
                Button {
                    if !( externalDisplayContent.screenHeight < externalDisplayContent.shapeTotalHeight) {
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
                    Text(AppConst.Text.buttonTap)
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .background(Color.customColorGreen)
                .cornerRadius(40)
            }
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
struct AddShapesView_Previews: PreviewProvider {
    static var previews: some View {
        AddShapesView()
    }
}
