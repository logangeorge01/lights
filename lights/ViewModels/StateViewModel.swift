//
//  StateViewModel.swift
//  lights
//
//  Created by Logan George on 1/29/20.
//  Copyright © 2020 Lag Software. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class StateViewModel: ObservableObject {
    init() {
        self.get()
    }
    
    func get() {
        LightService().getState {
            self.on = $0.state.on
            self.colorloop = $0.state.on ? ($0.state.effect == "colorloop") : false
        }
    }
    
    @Published var on: Bool = false
    @Published var colorloop: Bool = false
}
