import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // 앱이 실행될 때 최초로 호출되는 메서드
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // scene이 UIWindowScene으로 캐스팅 가능한지 확인
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // UIWindow 인스턴스 생성 및 연결
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ViewController()  // 앱의 첫 번째 화면
        self.window = window
        window.makeKeyAndVisible()
    }
}

