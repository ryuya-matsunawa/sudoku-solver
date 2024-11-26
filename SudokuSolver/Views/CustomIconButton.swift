//
//  CustomIconButton.swift
//  SudokuSolver
//
//  Created by 松縄竜弥 on 2024/11/26.
//

import SwiftUI

struct CustomIconButton: View {
    var action: () -> Void
    var iconName: String
    var label: String
    var color: Color

    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) { // アイコンとラベルの間隔を調整
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit() // アスペクト比を維持
                    .frame(width: 30, height: 30) // アイコンのサイズを固定
                Text(label)
                    .font(.caption)
            }
            .padding()
            .frame(width: 80, height: 60) // ボタン全体のサイズを統一
            .background(color)
            .cornerRadius(10)
            .foregroundColor(.white)
        }
    }
}

