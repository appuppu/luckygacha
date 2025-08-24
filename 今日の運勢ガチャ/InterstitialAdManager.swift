import Foundation
import GoogleMobileAds

class InterstitialAdManager: NSObject, ObservableObject {
    @Published var isAdReady = false
    private var interstitialAd: InterstitialAd?
    private let adUnitID: String
    
    init(adUnitID: String) {
        self.adUnitID = adUnitID
        super.init()
        loadAd()
    }
    
    func loadAd() {
        let request = Request()
        InterstitialAd.load(with: adUnitID, request: request) { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                self.isAdReady = false
                return
            }
            self.interstitialAd = ad
            self.interstitialAd?.fullScreenContentDelegate = self
            self.isAdReady = true
            print("Interstitial ad loaded successfully")
        }
    }
    
    func showAd() {
        guard let interstitialAd = interstitialAd,
              let rootViewController = getRootViewController() else {
            print("Interstitial ad not ready or root view controller not found")
            return
        }
        
        interstitialAd.present(from: rootViewController)
    }
    
    private func getRootViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return nil
        }
        return window.rootViewController
    }
}

extension InterstitialAdManager: FullScreenContentDelegate {
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Failed to present interstitial ad: \(error.localizedDescription)")
    }
    
    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Interstitial ad will present")
    }
    
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Interstitial ad dismissed")
        loadAd() // Load next ad
    }
}