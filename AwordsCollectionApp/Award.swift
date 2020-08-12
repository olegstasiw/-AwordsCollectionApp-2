//
//  Award.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 10.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct Award {
    let awardView: AnyView
    let title: String
    let awarded: Bool
    
    static func getAwards() -> [Award] {
        return [
            Award(awardView: AnyView(GradientRectangles()),
                  title: "My First Award",
                  awarded: true),
            Award(awardView: AnyView(PathView()),
                  title: "My Second Award",
                  awarded: true),
            Award(awardView: AnyView(CurvesView()),
                  title: "My Third Award",
                  awarded: true),
            Award(awardView: AnyView(HypocycloidView(bigR: 8, smalR: 3)),
                  title: "My Fourth Award",
                  awarded: true)
        ]
    }
}


