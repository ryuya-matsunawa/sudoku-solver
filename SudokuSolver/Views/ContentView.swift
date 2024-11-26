import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SudokuViewModel()

    var body: some View {
        VStack {
            // Header
            HeaderView()
                .padding(.bottom)
        
            // Sudoku Grid
            GridView(
                sudokuGrid: Binding(
                    get: { viewModel.sudokuGrid.grid },
                    set: { viewModel.sudokuGrid.grid = $0 }
                ),
                selectedCell: $viewModel.selectedCell
            )
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(alignment: .top, spacing: 15) {
                // 左カラム
                NumberInputView(
                    sudokuGrid: Binding(
                        get: { viewModel.sudokuGrid.grid },
                        set: { viewModel.sudokuGrid.grid = $0 }
                    ),
                    selectedCell: $viewModel.selectedCell,
                    updateGrid: { row, col, number in
                        viewModel.updateGrid(row: row, col: col, number: number)
                    }
                )
                .frame(minHeight: 300)

                // 右カラム
                VStack(spacing: 10) {
                    CustomIconButton(action: {
                        // Camera functionality
                    }, iconName: "camera", label: "Camera", color: .gray)
                        .frame(height: 60)

                    CustomIconButton(action: {
                        viewModel.resetGrid()
                    }, iconName: "arrow.counterclockwise", label: "Reset", color: .gray)
                        .frame(height: 60)

                    CustomIconButton(action: {
                        viewModel.undo()
                    }, iconName: "arrow.uturn.left", label: "Undo", color: .gray)
                        .frame(height: 60)

                    CustomIconButton(action: {
                        if let selected = viewModel.selectedCell {
                            viewModel.sudokuGrid[selected.row, selected.col] = ""
                        }
                    }, iconName: "trash", label: "Clear", color: .gray)
                        .frame(height: 60)
                }
                .frame(minHeight: 300)
            }
        }
        .background(Color.gray.opacity(0.2))
    }
}
