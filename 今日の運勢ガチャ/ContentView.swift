//
//  ContentView.swift
//  今日の運勢ガチャ
//
//  Created by 福島匠 on 2025/08/23.
//

import SwiftUI
import GoogleMobileAds

struct ContentView: View {
    @State private var currentFortune: Fortune?
    @State private var isSpinning = false
    @State private var showResult = false
    @State private var gachaCount = 0
    @StateObject private var interstitialAdManager = InterstitialAdManager(adUnitID: AdConfig.interstitialAdUnitID)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.3), Color.pink.opacity(0.3)]),
                          startPoint: .topLeading,
                          endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("今日の運勢ガチャ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                if let fortune = currentFortune, showResult {
                    VStack(spacing: 20) {
                        Text(fortune.emoji)
                            .font(.system(size: 80))
                            .scaleEffect(showResult ? 1.0 : 0.5)
                            .animation(.spring(response: 0.6, dampingFraction: 0.6), value: showResult)
                        
                        Text(fortune.category.rawValue)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(getColorForCategory(fortune.category))
                            .shadow(radius: 3)
                            .scaleEffect(showResult ? 1.0 : 0.0)
                            .animation(.spring(response: 0.5, dampingFraction: 0.7).delay(0.1), value: showResult)
                        
                        Text(fortune.message)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .shadow(radius: 2)
                            .opacity(showResult ? 1.0 : 0.0)
                            .animation(.easeIn(duration: 0.5).delay(0.2), value: showResult)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.2))
                            .blur(radius: 5)
                    )
                    .padding(.horizontal, 20)
                } else {
                    Image(systemName: "dice")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(isSpinning ? 360 : 0))
                        .animation(.linear(duration: 0.5).repeatWhile(isSpinning, autoreverses: false), value: isSpinning)
                        .shadow(radius: 5)
                }
                
                Button(action: {
                    drawFortune()
                }) {
                    Text("ガチャを回す")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                          startPoint: .leading,
                                          endPoint: .trailing)
                        )
                        .cornerRadius(30)
                        .shadow(radius: 5)
                }
                .disabled(isSpinning)
                .opacity(isSpinning ? 0.6 : 1.0)
                .scaleEffect(isSpinning ? 0.95 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: isSpinning)
            }
            .padding()
            
            VStack {
                Spacer()
                AdaptiveBannerView(adUnitID: AdConfig.bannerAdUnitID)
                    .frame(height: 50)
            }
        }
    }
    
    private func drawFortune() {
        // アニメーション状態を完全にリセット
        withAnimation(.none) {
            showResult = false
            currentFortune = nil
        }
        
        // 少し遅延してからスピニング開始
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isSpinning = true
            gachaCount += 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                currentFortune = FortuneData.shared.getRandomFortune()
                isSpinning = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        showResult = true
                    }
                    
                    // 5回ごとにインタースティシャル広告を表示
                    if gachaCount % 5 == 0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            interstitialAdManager.showAd()
                        }
                    }
                }
            }
        }
    }
    
    private func getColorForCategory(_ category: FortuneCategory) -> Color {
        switch category {
        case .daikichi:
            return .yellow
        case .chukichi:
            return .orange
        case .shokichi:
            return .green
        case .suekichi:
            return .blue
        case .kyo:
            return .purple
        }
    }
}

extension Animation {
    func repeatWhile(_ condition: Bool, autoreverses: Bool = true) -> Animation {
        if condition {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}

#Preview {
    ContentView()
}