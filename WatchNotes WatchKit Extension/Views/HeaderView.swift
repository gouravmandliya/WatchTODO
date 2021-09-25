//
//  HeaderView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Gourav on 03/07/21.
//

import SwiftUI

struct HeaderView: View {
    var title :String = ""
    var body: some View {
        if title != ""{
            
        }
        VStack{
            if title != ""{
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
            }
            HStack{
                Capsule()
                    .frame(height:1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height:1)
                
            }
            .foregroundColor(.yellow)
            
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            HeaderView(title: "CREDITS")
            HeaderView()
        }
    }
}
