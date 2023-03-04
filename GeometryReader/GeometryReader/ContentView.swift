//
//  ContentView.swift
//  GeometryReader
//
//  Created by MacBook Pro on 06/01/23.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack{
                ForEach(0..<20){ index in
                    GeometryReader{ geometry in
                      RoundedRectangle(cornerRadius: 20)
//                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 40), axis: (x: 0, y: 1, z: 0))
                            .foregroundColor(getPercentage(geo: geometry)   < 0.5 && getPercentage(geo: geometry)  > -0.5 ? .red : .yellow)
                    }
                    .frame(width: 300,height: 250)
                    .padding()
//                    .background(.green)
                }
            }
//            .background(.blue)

        }
        
        
    }
     
    func getPercentage(geo : GeometryProxy) -> Double{
        let maxDistance =  UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        print(1 - (currentX / maxDistance))
        return Double(1 - (currentX / maxDistance)  )
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
