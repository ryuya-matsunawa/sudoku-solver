import SwiftUI

struct GridView: View {
    @Binding var sudokuGrid: [[String]]
    @Binding var selectedCell: (row: Int, col: Int)?

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 外枠の太枠（上下左右）
                Rectangle()
                    .stroke(Color.blue, lineWidth: 4) // 外枠の太線
                    .padding(2) // 内側の余白を調整
                    .zIndex(1)

                VStack(spacing: 0) {
                    ForEach(0..<9, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<9, id: \.self) { col in
                                ZStack {
                                    // セルの選択状態に応じて色を変更
                                    Rectangle()
                                        .fill(selectedCell?.row == row && selectedCell?.col == col ? Color.yellow : Color.white)
                                        .border(Color.gray, width: 1)

                                    TextField("", text: $sudokuGrid[row][col])
                                        .frame(width: (geometry.size.width - 8) / 9, height: (geometry.size.width - 8) / 9) // 動的にセルサイズを調整
                                        .multilineTextAlignment(.center)
                                        .keyboardType(.numberPad)
                                        .background(Color.clear)
                                        .disabled(true)
                                }
                                .onTapGesture {
                                    selectedCell = (row, col)
                                }
                            }
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.width) // グリッドのサイズを調整

                // 3x3ブロックの境界線を描画
                ForEach([3, 6], id: \.self) { i in
                    // 縦の太線
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 4)
                        .position(x: (geometry.size.width / 9) * CGFloat(i), y: geometry.size.height / 2)

                    // 横の太線
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 4)
                        .position(x: geometry.size.width / 2, y: (geometry.size.width / 9) * CGFloat(i))
                }
            }
        }
    }
}
