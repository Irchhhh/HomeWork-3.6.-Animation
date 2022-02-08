//
//  WavesView.swift
//  HomeWork 3.6. Animations
//
//  Created by Ирина on 07.02.2022.
//

import SwiftUI

struct WavesView: View {
    @State var animated = false
    let universalSize = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            getSeenWave(
                interval: universalSize.width * 1.5,
                amplitude: 110,
                baseLine: 65 + universalSize.height / 2
            )
                .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                .offset(x: animated ? -1 * universalSize.width * 1.5 : 0)
                .animation(
                    Animation.linear(duration: 5)
                        .repeatForever(autoreverses: false),
                    value: animated)
            
            getSeenWave(
                interval: universalSize.width,
                amplitude: 200,
                baseLine: 70 + universalSize.height / 2
            )
                .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                .offset(x: animated ? -1 * universalSize.width : 0)
                .animation(
                    Animation.linear(duration: 11)
                        .repeatForever(autoreverses: false),
                    value: animated)
            
            getSeenWave(
                interval: universalSize.width * 3,
                amplitude: 200,
                baseLine: 95 + universalSize.height / 2
            )
                .foregroundColor(Color.black.opacity(0.2))
                .offset(x: animated ? -1 * universalSize.width * 3 : 0)
                .animation(
                    Animation.linear(duration: 11)
                        .repeatForever(autoreverses: false),
                    value: animated)
            
            getSeenWave(
                interval: universalSize.width * 1.2,
                amplitude: 50,
                baseLine: 75 + universalSize.height / 2
            )
                .foregroundColor(Color.init(
                    red: 0.3,
                    green: 0.6,
                    blue: 1
                ).opacity(0.4))
                .offset(x: animated ? -1 * universalSize.width * 1.2 : 0)
                .animation(
                    Animation.linear(duration: 4)
                        .repeatForever(autoreverses: false),
                    value: animated)
        } .onAppear() {
            self.animated = true
        }
    }
    
    func getSeenWave(
        interval: CGFloat,
        amplitude: CGFloat = 100,
        baseLine: CGFloat = UIScreen.main.bounds.height / 2
    ) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: baseLine))
            path.addCurve(
                to: CGPoint(
                    x: 1 * interval,
                    y: baseLine
                ),
                control1: CGPoint(
                    x: interval * 0.35,
                    y: amplitude + baseLine
                ),
                control2: CGPoint(
                    x: interval * 0.65,
                    y: -amplitude + baseLine
                ))
            
            path.addCurve(
                to: CGPoint(
                    x: 2 * interval,
                    y: baseLine
                ),
                control1: CGPoint(
                    x: interval * 1.35,
                    y: amplitude + baseLine
                ),
                
                control2: CGPoint(
                    x: interval * 1.65,
                    y: -amplitude + baseLine
                ))
            
            path.addCurve(
                to: CGPoint(
                    x: 3 * interval,
                    y: baseLine),
                control1: CGPoint(
                    x: interval * 2.35,
                    y: amplitude + baseLine
                ),
                
                control2: CGPoint(
                    x: interval * 2.65,
                    y: -amplitude + baseLine
                ))
            
            path.addCurve(
                to: CGPoint(
                    x: 4 * interval,
                    y: baseLine
                ),
                control1: CGPoint(
                    x: interval * 3.35,
                    y: amplitude + baseLine
                ),
                
                control2: CGPoint(
                    x: interval * 3.65,
                    y: -amplitude + baseLine
                ))
            
            
            path.addLine(to: CGPoint(
                x: 2 * universalSize.width,
                y: universalSize.height
            ))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
        }
    }
}
struct WavesView_Previews: PreviewProvider {
    static var previews: some View {
        WavesView()
    }
}

