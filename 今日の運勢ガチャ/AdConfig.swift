import Foundation

struct AdConfig {
    // App ID
    static let appId = "ca-app-pub-3107120992746486~5564268894"
    
    #if DEBUG
    // テスト用広告ID（開発環境）
    static let bannerAdUnitID = "ca-app-pub-3940256099942544/6300978111"
    static let interstitialAdUnitID = "ca-app-pub-3940256099942544/1033173712"
    #else
    // 本番用広告ID（リリース環境）
    static let bannerAdUnitID = "ca-app-pub-3107120992746486/8605365209"
    static let interstitialAdUnitID = "ca-app-pub-3107120992746486/1848385162"
    #endif
    
    // テスト端末のデバイスID
    static let testDeviceIdentifiers = [
        "GADSimulatorID"  // シミュレーター
    ]
}