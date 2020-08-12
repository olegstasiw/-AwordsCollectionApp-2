//
//  GridView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 10.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct GridView<Conten, T>: View where Conten: View {
    var items: [T]
    var columns: Int
    var rows: Int {
        items.count / columns
    }

    let content: (CGFloat, T) -> Conten
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ForEach(0...self.rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<self.columns) { columnsIndex in
                                Group {
                                    if self.elementFor(row: rowIndex, and: columnsIndex) != nil {
                                        self.content(geometry.size.width / CGFloat(self.columns), self.items[self.elementFor(row: rowIndex, and: columnsIndex)!])

                                    } else {
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension GridView {
    private func elementFor(row: Int, and colomn: Int) -> Int? {
        let index = row * columns + colomn
        return index < items.count ? index : nil
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(items: [11, 3, 7, 17, 5, 2, 1], columns: 3) { size, item  in
            Text("\(item)")
            .frame(width: size, height: size)
        }
    }
}
