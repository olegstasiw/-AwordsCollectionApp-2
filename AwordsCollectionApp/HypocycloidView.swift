//
//  HypocycloidView.swift
//  Lesson 6
//
//  Created by Alexey Efimov on 24.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI


struct HypocycloidView: View {
    let bigR: Double
    let smalR: Double
    let p = 1.0
    let color = Color.red
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let size = min(geometry.size.width, geometry.size.height)
                let ratio = Double(size) / ((self.bigR - self.smalR) + self.smalR * self.p) / 2.0
                
                var angle = 0
                let maxT = 2880
                var curveClosed = false
                
                var x0 = 0.0
                var y0 = 0.0
                while(angle < maxT && !curveClosed) {
                    let theta = Angle.init(degrees: Double(angle)).radians
                    let component = ((self.bigR + self.smalR) / self.smalR) * theta
                    let x = (self.bigR - self.smalR) * cos(theta) + self.smalR * self.p * cos(component)
                    let y = (self.bigR - self.smalR) * sin(theta) - self.smalR * self.p * sin(component)
                    
                    let xc = x * ratio
                    let yc = y * ratio
                    if angle == 0 {
                        x0 = xc
                        y0 = yc
                        path.move(to: CGPoint(x: x0, y: y0))
                    } else {
                        path.addLine(to: CGPoint(x: xc, y: yc))
                        if abs(xc - x0) < 0.25 && abs(yc - y0) < 0.25 {
                            curveClosed = true
                        }
                    }
                    angle = angle + 1
                }
            }
            .offset(x: geometry.size.width / 2.0, y: geometry.size.height / 2.0)
            .stroke(self.color, lineWidth: 1)
        }
    }
}

struct HypocycloidView_Previews: PreviewProvider {
    static var previews: some View {
        HypocycloidView(bigR: 8, smalR: 3)
    }
}
