import Foundation
// import GoogleMobileAds

/// AdMobマネージャー（一時的に無効化）
class AdMobManager: ObservableObject {
    static let shared = AdMobManager()
    
    private init() {}
    
    /// AdMobを初期化（一時的に無効化）
    func initialize() {
        print("AdMobManager: Disabled for testing")
        // 広告機能は一時的に無効化されています
    }
}