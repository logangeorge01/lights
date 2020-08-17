//
//  webservice.swift
//  lights
//
//  Created by Logan George on 1/29/20.
//  Copyright © 2020 Lag Software. All rights reserved.
//

import Foundation

// home ip is 192.168.0.29

class LightService {
    func getState(completion: @escaping (LightState) -> ()) {
        let url = URL(string: "http://130.160.144.124/api/P2VP8PosWfQE9UkmylScVACXMMCaTCw18ka0NwCJ/lights/1")
        
        URLSession.shared.dataTask(with: url!) { data, _, _ in
            let dat = try! JSONDecoder().decode(LightState.self, from: data!)
            DispatchQueue.main.async {
                completion(dat)
            }
        }.resume()
    }
    
    func setState(json: [String: Any], completion: @escaping () -> ()) {
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        let url = URL(string: "http://130.160.144.124/api/P2VP8PosWfQE9UkmylScVACXMMCaTCw18ka0NwCJ/groups/1/action")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // let dat = try! JSONDecoder().decode([Success].self, from: data!)
            DispatchQueue.main.async {
                completion()
            }
        }.resume()
    }
    
    func toggle(completion: @escaping () -> ()) {
        getState() {
            let json = ["on": !$0.state.on]
            self.setState(json: json) {
                completion()
            }
        }
    }
    
    func colorLoop(completion: @escaping () -> ()) {
        getState() {
            let json = ["effect": $0.state.effect=="colorloop" ? "none" : "colorloop"]
            self.setState(json: json) {
                completion()
            }
        }
    }
    
    func setHue(hue: Int) {
        let json = ["hue": hue]
        self.setState(json: json) {}
    }
    
    func setSat(sat: Int) {
        let json = ["sat": sat]
        self.setState(json: json) {}
    }
    
    func setBri(bri: Int) {
        let json = ["bri": bri]
        self.setState(json: json) {}
    }
}
