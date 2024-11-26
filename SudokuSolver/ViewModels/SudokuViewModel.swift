import SwiftUI

class SudokuViewModel: ObservableObject {
    @Published var sudokuGrid = SudokuGrid()  // ModelsのSudokuGridを使用
    @Published var selectedCell: (row: Int, col: Int)? = nil
    private var previousStates: [SudokuGrid] = []  // 状態を保存する配列

    // 状態保存関数
    private func saveState() {
        previousStates.append(sudokuGrid)  // 現在の状態を保存
    }

    // Undo処理
    func undo() {
        guard let lastState = previousStates.popLast() else { return }
        sudokuGrid = lastState  // 最後の状態を戻す
    }

    // 数字を入力したときに状態を保存
    func updateGrid(row: Int, col: Int, number: String) {
        saveState()  // 数字を更新する前に状態を保存
        sudokuGrid[row, col] = number  // subscriptを使って更新
    }

    // グリッド全体をリセット
    func resetGrid() {
        sudokuGrid.reset()
        selectedCell = nil
    }
}
