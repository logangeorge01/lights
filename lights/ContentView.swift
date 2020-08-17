//
//  ContentView.swift
//  lights
//
//  Created by Logan George on 1/28/20.
//  Copyright © 2020 Lag Software. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = StateViewModel()
    
    var body: some View {
        VStack() {
            Text("Lights")
            .foregroundColor(Color.black)
            .fontWeight(.bold)
            .font(.system(size: 42, design: .rounded))
            .offset(y: -100)
            
            HStack() {
                Button(action: {
                    LightService().toggle {
                        self.model.get()
                    }
                }) {
                    HStack {
                        Image(systemName: model.on ? "lightbulb" : "lightbulb.fill")
                            .font(.title)
                        Text("Lights " + String(model.on ? "off" : "on"))
                        .font(.system(size: 18, design: .rounded))
                        .fontWeight(.bold)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(30)
                }
                Button(action: {
                    LightService().colorLoop {
                        self.model.get()
                    }
                }) {
                    HStack {
                        Image(systemName: model.colorloop ? "arrow.2.circlepath.circle" : "arrow.2.circlepath.circle.fill")
                            .font(.title)
                        Text(String(model.colorloop ? "Stop" : "Start") + " colorloop")
                        .font(.system(size: 18, design: .rounded))
                        .fontWeight(.bold)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(30)
                }
            }.offset(y: -50)
            
            VStack() {
                HStack() {
                    HueButton(color: Color.red, hue: 65100)
                    HueButton(color: Color.orange, hue: 1900)
                }
                HStack() {
                    HueButton(color: Color.purple, hue: 50500)
                    HueButton(color: Color.pink, hue: 57000)
                    HueButton(color: Color.yellow, hue: 8418)
                }
                HStack() {
                    HueButton(color: Color.blue, hue: 44500)
                    HueButton(color: Color.green, hue: 24000)
                }
            }
            
            VStack() {
                Text("Saturation")
                .font(.system(size: 24, design: .rounded))
                .fontWeight(.bold)
                HStack() {
                    SatButton(text: "LO", sat: 60, color: Color(red: 1.0, green: 0.38, blue: 0.38))
                    SatButton(text: "MD", sat: 150, color: Color(red: 0.98, green: 0.20, blue: 0.20))
                    SatButton(text: "HI", sat: 250, color: Color(red: 0.96, green: 0.02, blue: 0.02))
                }
            }.offset(y: 50)
            
            VStack() {
                Text("Brightness")
                .font(.system(size: 24, design: .rounded))
                .fontWeight(.bold)
                HStack() {
                    BriButton(text: "LO", bri: 60, color: Color(red: 1.0, green: 1.0, blue: 0.5))
                    BriButton(text: "MD", bri: 150, color: Color(red: 0.98, green: 0.98, blue: 0.26))
                    BriButton(text: "HI", bri: 250, color: Color(red: 0.96, green: 0.96, blue: 0.02))
                }
            }.offset(y: 100)
        }
    }
}

struct HueButton: View {
    let color: Color
    let hue: Int
    
    var body: some View {
        Button(action: {
            LightService().setHue(hue: self.hue)
        }) {
            Text("")
            .frame(width: 40, height: 40, alignment: .center)
            .background(color)
            .cornerRadius(40)
            .padding(5)
            /*.overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 3)
            )*/
        }
    }
}

struct SatButton: View {
    let text: String
    let sat: Int
    let color: Color
    
    var body: some View {
        Button(action: {
            LightService().setSat(sat: self.sat)
        }) {
            Text(text)
            .font(.system(size: 18, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .frame(width: 40, height: 40, alignment: .center)
                .background(self.color)
            .cornerRadius(40)
            .padding(5)
            /*.overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 3)
            )*/
        }
    }
}

struct BriButton: View {
    let text: String
    let bri: Int
    let color: Color
    
    var body: some View {
        Button(action: {
            LightService().setBri(bri: self.bri)
        }) {
            Text(self.text)
            .font(.system(size: 18, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .frame(width: 40, height: 40, alignment: .center)
            .background(self.color)
            .cornerRadius(40)
            .padding(5)
            /*.overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 3)
            )*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
