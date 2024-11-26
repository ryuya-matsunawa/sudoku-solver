import Foundation

struct SudokuGrid {
    var grid: [[String]] = Array(repeating: Array(repeating: "", count: 9), count: 9)

    subscript(row: Int, col: Int) -> String {
        get {
            return grid[row][col]
        }
        set {
            grid[row][col] = newValue
        }
    }

    mutating func reset() {
        grid = Array(repeating: Array(repeating: "", count: 9), count: 9)
    }
}
