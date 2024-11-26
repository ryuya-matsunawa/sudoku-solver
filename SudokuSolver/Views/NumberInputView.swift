import SwiftUI

struct NumberInputView: View {
    @Binding var sudokuGrid: [[String]]
    @Binding var selectedCell: (row: Int, col: Int)?
    var updateGrid: (Int, Int, String) -> Void // 状態更新のためのクロージャを受け取る

    var body: some View {
        VStack(spacing: 10) { // ボタン間の垂直スペース
            ForEach(0..<3, id: \.self) { row in
                HStack(spacing: 10) { // ボタン間の水平スペース
                    ForEach(1..<4, id: \.self) { col in
                        let number = row * 3 + col
                        Button(action: {
                            if let selected = selectedCell {
                                // 直接更新せずに updateGrid を呼び出す
                                updateGrid(selected.row, selected.col, "\(number)")
                            }
                        }) {
                            Text("\(number)")
                                .font(.title) // 数字を見やすく
                                .frame(width: 60, height: 60) // サイズを右側のボタンと揃える
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            Button(action: {
                // Solve ボタンのアクションを追加
                // ここに解答処理を実装
                print("Solve the Sudoku puzzle")
            }) {
                Text("Solve")
                    .font(.title2) // Solveボタンのフォントサイズ
                    .frame(width: 200, height: 60) // 幅を数字ボタンの3列分と揃える
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(minHeight: 300)
    }
}
