//
//  DropRainView.swift
//  HomeWork 3.6. Animations
//
//  Created by Ирина on 07.02.2022.
//

import SwiftUI

struct DropRainView: Shape {
    var body: some View {
    DropRainView()
            .fill(LinearGradient(colors: [.white, .blue], startPoint: .topLeading, endPoint: .bottom))
            .frame(width: 50, height: 50)
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.size.width / 2, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.size.width / 2, y: rect.size.height),
                              control: CGPoint(x: rect.size.width, y: rect.size.height))
            
            path.addQuadCurve(to: CGPoint(x: rect.size.width / 2, y: 0),
                              control: CGPoint(x: 0, y: rect.size.height))
        }
    }
}
struct DropRainView_Previews: PreviewProvider {
    static var previews: some View {
        DropRainView()
    }
}
