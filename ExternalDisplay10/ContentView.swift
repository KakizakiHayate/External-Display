//
//  ContentView.swift
//  ExternalDisplay10
//
//  Created by 柿崎逸 on 2023/06/09.
//

import SwiftUI

struct ContentView: View {
    @State private var circles: [Circle] = [
        Circle(radius: 50),
        Circle(radius: 30),
        Circle(radius: 20)
    ]

    var body: some View {
        VStack {
            ForEach(circles, id: \.self) { circle in
                CircleView(circle: circle)
                Circle()
            }

            Button("Add Circle") {
                let randomRadius = Double.random(in: 10...50)
                let newCircle = Circle(radius: randomRadius)
                circles.append(newCircle)
            }
        }
    }
}

struct CircleView: View {
    let circle: Circle

    var body: some View {
        Circle()
            .frame(width: circle.radius * 2, height: circle.radius * 2)
            .foregroundColor(.blue)
            .padding()
    }
}

struct Circle {
    let radius: Double
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

