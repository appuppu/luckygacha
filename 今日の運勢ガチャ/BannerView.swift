import SwiftUI
import GoogleMobileAds

struct AdBannerView: UIViewRepresentable {
    let adUnitID: String
    
    func makeUIView(context: Context) -> BannerView {
        let bannerView = BannerView(adSize: AdSizeBanner)
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = getRootViewController()
        bannerView.load(Request())
        return bannerView
    }
    
    func updateUIView(_ uiView: BannerView, context: Context) {}
    
    private func getRootViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return nil
        }
        return window.rootViewController
    }
}

struct AdaptiveBannerView: UIViewRepresentable {
    let adUnitID: String
    
    func makeUIView(context: Context) -> BannerView {
        let bannerView = BannerView()
        
        // アダプティブバナーサイズを設定
        let frame = { () -> CGRect in
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                return window.frame
            }
            return UIScreen.main.bounds
        }()
        
        let viewWidth = frame.size.width
        bannerView.adSize = AdSizeBanner
        
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = getRootViewController()
        bannerView.load(Request())
        
        return bannerView
    }
    
    func updateUIView(_ uiView: BannerView, context: Context) {}
    
    private func getRootViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return nil
        }
        return window.rootViewController
    }
}