import Foundation

enum FortuneCategory: String, CaseIterable {
    case daikichi = "大吉"
    case chukichi = "中吉"
    case shokichi = "小吉"
    case suekichi = "末吉"
    case kyo = "凶"
}

struct Fortune: Identifiable {
    let id = UUID()
    let category: FortuneCategory
    let message: String
    let emoji: String
}

class FortuneData {
    static let shared = FortuneData()
    
    private let fortunes: [Fortune] = [
        Fortune(category: .daikichi, message: "今日は何をやっても上手くいく日！", emoji: "✨"),
        Fortune(category: .daikichi, message: "サプライズな幸運が舞い込む予感", emoji: "💫"),
        Fortune(category: .daikichi, message: "ラッキーな出会いがありそう！", emoji: "💖"),
        Fortune(category: .daikichi, message: "頑張りが報われる1日になるよ", emoji: "🌟"),
        Fortune(category: .daikichi, message: "直感が冴える日、チャレンジに最適", emoji: "⚡"),
        Fortune(category: .daikichi, message: "笑顔が幸運を呼ぶ日", emoji: "😁"),
        Fortune(category: .daikichi, message: "偶然のチャンスを逃さないで", emoji: "💡"),
        Fortune(category: .daikichi, message: "今日は冒険心を出してみよう", emoji: "🌈"),
        Fortune(category: .daikichi, message: "人間関係がスムーズに進む日", emoji: "🤝"),
        Fortune(category: .daikichi, message: "ちょっとした贅沢が幸せに", emoji: "✨"),
        
        Fortune(category: .chukichi, message: "小さな幸せが積み重なる日", emoji: "🍀"),
        Fortune(category: .chukichi, message: "今日は新しいことに挑戦してみて", emoji: "💪"),
        Fortune(category: .chukichi, message: "気持ちが前向きになれる日", emoji: "🌞"),
        Fortune(category: .chukichi, message: "友達との会話が弾む予感", emoji: "🗨️"),
        Fortune(category: .chukichi, message: "ちょっとした努力が報われるかも", emoji: "🎯"),
        Fortune(category: .chukichi, message: "運動や散歩で運気アップ", emoji: "🏃‍♂️"),
        Fortune(category: .chukichi, message: "仕事や勉強に集中できる日", emoji: "📚"),
        Fortune(category: .chukichi, message: "美味しい食事でテンション上げよう", emoji: "🍣"),
        Fortune(category: .chukichi, message: "今日は早起きが吉", emoji: "⏰"),
        Fortune(category: .chukichi, message: "笑顔が運気を呼ぶ日", emoji: "😊"),
        
        Fortune(category: .shokichi, message: "今日はゆっくり過ごすのが吉", emoji: "🛋️"),
        Fortune(category: .shokichi, message: "ちょっとした気配りが幸運を呼ぶ", emoji: "💌"),
        Fortune(category: .shokichi, message: "計画通りに物事が進みやすい日", emoji: "📅"),
        Fortune(category: .shokichi, message: "好きな音楽を聴くと運気アップ", emoji: "🎵"),
        Fortune(category: .shokichi, message: "ちょっとした買い物が吉", emoji: "🛒"),
        Fortune(category: .shokichi, message: "コーヒータイムで運気回復", emoji: "☕"),
        Fortune(category: .shokichi, message: "無理せず休むのが運気を呼ぶ日", emoji: "💤"),
        Fortune(category: .shokichi, message: "整理整頓で心も運気もスッキリ", emoji: "🧹"),
        Fortune(category: .shokichi, message: "SNSで小さな幸せをシェアしよう", emoji: "📱"),
        Fortune(category: .shokichi, message: "笑顔で挨拶すると良いことあり", emoji: "😊"),
        
        Fortune(category: .suekichi, message: "今日は焦らず慎重に行動を", emoji: "⚠️"),
        Fortune(category: .suekichi, message: "小さなトラブルに注意", emoji: "💦"),
        Fortune(category: .suekichi, message: "無理は禁物、休む時間を大切に", emoji: "🛌"),
        Fortune(category: .suekichi, message: "人間関係は丁寧に対応を", emoji: "🤝"),
        Fortune(category: .suekichi, message: "お金の使いすぎに注意", emoji: "💰"),
        Fortune(category: .suekichi, message: "計画の見直しをする日", emoji: "📝"),
        Fortune(category: .suekichi, message: "体調に気をつけて、ゆっくり休もう", emoji: "🍵"),
        Fortune(category: .suekichi, message: "今日は新しいことは避けたほうが吉", emoji: "🚫"),
        Fortune(category: .suekichi, message: "感情的にならず冷静に行動を", emoji: "🧊"),
        Fortune(category: .suekichi, message: "小さなミスに注意、確認を怠らず", emoji: "✅"),
        
        Fortune(category: .kyo, message: "今日は思わぬハプニングがあるかも", emoji: "😱"),
        Fortune(category: .kyo, message: "忘れ物に注意！", emoji: "🔑"),
        Fortune(category: .kyo, message: "ちょっとしたトラブルが起こるかも", emoji: "⚡"),
        Fortune(category: .kyo, message: "予定通りに進まない日かも", emoji: "📉"),
        Fortune(category: .kyo, message: "無理はせず、安全第一で", emoji: "🛑"),
        Fortune(category: .kyo, message: "今日は急がず、ゆっくりが吉", emoji: "🕰️"),
        Fortune(category: .kyo, message: "SNSでの発言に注意", emoji: "⚠️"),
        Fortune(category: .kyo, message: "些細なことでイライラしやすいかも", emoji: "😤"),
        Fortune(category: .kyo, message: "財布や持ち物を確認する日", emoji: "💼"),
        Fortune(category: .kyo, message: "いつもより慎重に行動して運気回避", emoji: "💡")
    ]
    
    func getRandomFortune() -> Fortune {
        return fortunes.randomElement()!
    }
}