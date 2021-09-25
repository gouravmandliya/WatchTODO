//
//  CreditsView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Gourav on 03/07/21.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    private var randomImage:String
    {
        return "developer-no\(randomNumber)"
    }
    var body: some View {
        VStack( spacing: 3, content: {
            
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            HeaderView(title: "CREDITS")
           Text("Gourav Mandliya")
            .foregroundColor(.primary)
            .fontWeight(.bold)
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        })
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
