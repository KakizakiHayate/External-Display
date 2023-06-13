//
//  ExternalDisplay10App.swift
//  ExternalDisplay10
//
//  Created by cmStudent on 2023/05/24.
//

import SwiftUI
import Combine

@main
struct ExternalDisplay10App: App {
    // viewModelをContentView,ExternalViewで使えるようにするため、
    // EnvironmentObjectで繋ぐ
    @StateObject var externalDisplayContent: ExternalDisplayContent = .init()
    // UIWndowの入れ物
    @State var additionalWindows: [UIWindow] = []
    // 外部ディスプレイと接続したかどうかを検知して通知するNotification
    private var sceneWillConnectorPublisher: AnyPublisher<UIWindowScene, Never> {
        // 外部ディスプレイとつないだ時のNotification…と言ったが、実際はwindowが２つになったとかそういうときにも動く
        NotificationCenter.default.publisher(for: UIScene.willConnectNotification)
        //compactMapはnilを次に進ませない
            .compactMap { $0.object as? UIWindowScene }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
     
    // 切断したとき
    // 外部ディスプレイと接続したかどうかを検知して通知するNotification
    private var sceneDidDisconnectorPublisher: AnyPublisher<UIWindowScene, Never> {
        // 外部ディスプレイとつないだ時のNotification…と言ったが、実際はwindowが２つになったとかそういうときにも動く
        NotificationCenter.default.publisher(for: UIScene.didDisconnectNotification)// 切断通知
        //compactMapはnilを次に進ませない
            .compactMap { $0.object as? UIWindowScene }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var body: some Scene {
        WindowGroup {
            AddShapesView()
                .environmentObject(externalDisplayContent)
                .onReceive(sceneWillConnectorPublisher, perform: sceneWillConnect)
                .onReceive(sceneDidDisconnectorPublisher, perform: sceneDidDisConnect)
        }
    }
    
    // つないだら映るようにしよう
    // windowをつくる
    
    // 引数ラベルあると上手く動かなくなる可能性
    private func sceneWillConnect(_ scene: UIWindowScene) {
        // sceneは接続したディスプレイの大きさを持っている
        // 接続したディスプレイと同じ大きさのwindowを作成する
        let window = UIWindow(frame: scene.screen.bounds)
        // UI
        //この話はUIKitまで
        // そのままSwiftUIのviewを置くことができない(表示できない)
        
        window.windowScene = scene
        // 表示したいview -> ExternalView
        let view = ExternalView().environmentObject(externalDisplayContent)
        // ここで作ったのはSwiftUIのview。これをUIKitのviewに変換する
        // hostingでできる（SwiftUI -> UIKit）
        // ViewControllerをSwiftUIのviewから作る
        let controller = UIHostingController(rootView: view)
        window.rootViewController = controller
        // 隠さない
        window.isHidden = false
        
        // メソッド内で作ったインスタンスはメソッドが終わったら消える
        additionalWindows.append(window)
        externalDisplayContent.isShowingOnExternalDisplay = true
    }
    
    // 切断時の処理
    private func sceneDidDisConnect(_ scene: UIWindowScene) {
        additionalWindows.removeAll { $0.windowScene == scene }
        externalDisplayContent.isShowingOnExternalDisplay = false
    }
}
