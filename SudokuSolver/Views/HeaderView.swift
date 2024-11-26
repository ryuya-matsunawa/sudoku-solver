import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Sudoku Solver")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding() // 必要であれば適切なパディングを設定
        }
        .frame(maxWidth: .infinity) // 画面幅いっぱいに広げる
        .background(Color.blue) // 背景色を青に設定
    }
}
