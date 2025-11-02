//
//  ChecklistItem.swift
//  SF-Symbol-Finder-Workshop
//
//  Created by ZENA on 10/26/25.
//

import SwiftUI

struct ChecklistItem: View {
    let text: String

    var body: some View {
        HStack {
            Image(systemName: "square")
                .foregroundColor(.blue)
            Text(text)
                .font(.subheadline)
        }
    }
}
