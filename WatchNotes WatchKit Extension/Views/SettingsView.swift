//
//  SettingsView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Gourav on 03/07/21.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("lineCount") var lineCount:Int = 1
    @State private var value : Float = 1.0
    
    func update(){
        lineCount = Int(value)
    }
    
    var body: some View {
       HeaderView(title: "Settings")
        Text("Lines: \(lineCount)".uppercased())
            .fontWeight(.bold)
        Slider(value: Binding(get: {
            Float(self.lineCount)
        }, set: { (newValue) in
            self.value = newValue
            self.update()
        }), in: 1...4, step: 1)
            .accentColor(.yellow)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
