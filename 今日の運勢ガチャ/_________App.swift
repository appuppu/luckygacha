import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency

@main
struct FortuneGachaApp: App {
    
    init() {
        // Info.plistの確認
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
           let plist = NSDictionary(contentsOfFile: path) {
            if let appId = plist["GADApplicationIdentifier"] as? String {
                print("✅ Found GADApplicationIdentifier: \(appId)")
            } else {
                print("❌ GADApplicationIdentifier not found in Info.plist")
                print("Available keys: \(plist.allKeys)")
            }
        } else {
            print("❌ Info.plist not found in bundle")
        }
        
        // Google Mobile Ads SDKを初期化
        MobileAds.shared.start { status in
            print("Google Mobile Ads SDK initialized")
            print("Status: \(status.adapterStatusesByClassName)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    requestIDFA()
                }
        }
    }
    
    private func requestIDFA() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    print("IDFA Permission: Authorized")
                case .denied:
                    print("IDFA Permission: Denied")
                case .notDetermined:
                    print("IDFA Permission: Not Determined")
                case .restricted:
                    print("IDFA Permission: Restricted")
                @unknown default:
                    print("IDFA Permission: Unknown")
                }
            }
        }
    }
}
