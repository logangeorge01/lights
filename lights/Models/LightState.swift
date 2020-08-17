//
//  Post.swift
//  lights
//
//  Created by Logan George on 1/29/20.
//  Copyright © 2020 Lag Software. All rights reserved.
//

import Foundation

struct LightState: Codable {
    let state: Props
}
struct Props: Codable {
    let on: Bool
    let effect: String
}

struct Success: Codable {
    let success: Loc
}
struct Loc: Codable {
    let on: Bool?
    let action: String?
    let hue: Int?
    let sat: Int?
    let bri: Int?
    
    private enum CodingKeys : String, CodingKey {
        case on = "/groups/1/action/on"
        case action = "/groups/1/action/effect"
        case hue = "/groups/1/action/hue"
        case sat = "/groups/1/action/sat"
        case bri = "/groups/1/action/bri"
    }
}
