import SwiftUI

@main
struct DailyFortuneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Fortune {
    let grade: String
    let yiji: String
    let desc: String
}

// 与安卓版完全相同的 16 支签
let fortunes: [Fortune] = [
    Fortune(grade: "上上签", yiji: "宜：大胆开局\n忌：反复横跳", desc: "今天适合把拖了很久的事直接动手，好运偏爱先行动的人。"),
    Fortune(grade: "大吉", yiji: "宜：出门走走\n忌：宅家刷手机", desc: "换个环境就有新灵感，幸运色是天空蓝。"),
    Fortune(grade: "中吉", yiji: "宜：请朋友吃饭\n忌：斤斤计较", desc: "人情往来会有回报，一顿饭能解决的都不是大事。"),
    Fortune(grade: "小吉", yiji: "宜：整理桌面\n忌：冲动下单", desc: "清爽的空间带来清爽的脑子，钱包也能保住。"),
    Fortune(grade: "上上签", yiji: "宜：表白心意\n忌：口是心非", desc: "想说的话今天就说，错过这班车要等很久。"),
    Fortune(grade: "大吉", yiji: "宜：早睡早起\n忌：熬夜赶工", desc: "精神好了，难题自己就松动了。"),
    Fortune(grade: "中平", yiji: "宜：按部就班\n忌：抄近道", desc: "今天没有捷径，但每一步都算数。"),
    Fortune(grade: "小吉", yiji: "宜：学个新技能\n忌：三分钟热度", desc: "哪怕只学十分钟，也是给明天的自己存钱。"),
    Fortune(grade: "上上签", yiji: "宜：投资自己\n忌：自我怀疑", desc: "你比自己以为的更能干，今天适合接个有挑战的活。"),
    Fortune(grade: "中吉", yiji: "宜：给家人打电话\n忌：把忙当借口", desc: "一句问候比红包更暖，幸运数字是 7。"),
    Fortune(grade: "大吉", yiji: "宜：尝试新菜谱\n忌：点同一家外卖", desc: "味蕾的新鲜感会传染给整个心情。"),
    Fortune(grade: "小吉", yiji: "宜：断舍离\n忌：什么都舍不得", desc: "扔掉一件旧物，好运就腾地方进来。"),
    Fortune(grade: "中平", yiji: "宜：先听后说\n忌：抢话打断", desc: "今天贵人藏在对话里，先把耳朵打开。"),
    Fortune(grade: "上上签", yiji: "宜：抬头看天\n忌：低头赶路", desc: "傍晚的云会给你一个答案，别错过。"),
    Fortune(grade: "大吉", yiji: "宜：完成比完美重要\n忌：无限改稿", desc: "先交出去，世界没有你想的那么挑剔。"),
    Fortune(grade: "小吉", yiji: "宜：存一笔小钱\n忌：报复性消费", desc: "小金库长大一点点，安全感就多一点点。")
]

struct ContentView: View {
    @State private var current: Fortune? = nil
    @State private var lucky: Int = 0

    private var todayText: String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "zh_CN")
        f.dateFormat = "yyyy 年 M 月 d 日 EEEE"
        return f.string(from: Date())
    }

    var body: some View {
        ZStack {
            Color(red: 250 / 255, green: 246 / 255, blue: 238 / 255)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("每日一签")
                    .font(.system(size: 36, weight: .bold, design: .serif))
                    .foregroundStyle(Color(red: 146 / 255, green: 32 / 255, blue: 32 / 255))
                    .padding(.top, 48)
                Text(todayText)
                    .font(.system(size: 15))
                    .foregroundStyle(Color(red: 120 / 255, green: 110 / 255, blue: 95 / 255))
                    .padding(.top, 10)

                Spacer()

                if let fortune = current {
                    VStack(spacing: 22) {
                        Text(fortune.grade)
                            .font(.system(size: 44, weight: .bold, design: .serif))
                            .foregroundStyle(Color(red: 178 / 255, green: 44 / 255, blue: 44 / 255))
                        Text(fortune.yiji)
                            .font(.system(size: 19))
                            .multilineTextAlignment(.center)
                            .lineSpacing(8)
                            .foregroundStyle(Color(red: 60 / 255, green: 55 / 255, blue: 45 / 255))
                        Text(fortune.desc)
                            .font(.system(size: 19))
                            .multilineTextAlignment(.center)
                            .lineSpacing(8)
                            .foregroundStyle(Color(red: 60 / 255, green: 55 / 255, blue: 45 / 255))
                            .padding(.horizontal, 40)
                        Text("今日幸运数字：\(lucky)")
                            .font(.system(size: 19))
                            .foregroundStyle(Color(red: 60 / 255, green: 55 / 255, blue: 45 / 255))
                    }
                    .transition(.opacity)
                } else {
                    Text("点下面的按钮，抽今天的签")
                        .font(.system(size: 19))
                        .foregroundStyle(Color(red: 60 / 255, green: 55 / 255, blue: 45 / 255))
                }

                Spacer()

                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        current = fortunes.randomElement()
                        lucky = Int.random(in: 1...99)
                    }
                } label: {
                    Text("抽 一 签")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 48)
                        .padding(.vertical, 16)
                        .background(Color(red: 178 / 255, green: 44 / 255, blue: 44 / 255), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .padding(.bottom, 56)
            }
        }
    }
}
