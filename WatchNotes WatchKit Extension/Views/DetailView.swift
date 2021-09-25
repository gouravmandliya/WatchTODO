//
//  DetailView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Gourav on 03/07/21.
//

import SwiftUI

struct DetailView: View {
    let note :Note
    let count : Int
    let index :Int
    
  
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingPresented:Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 3, content: {
            HStack{
                Capsule()
                    .frame(height:1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height:1)
                
            }
            .foregroundColor(.yellow)
            Spacer()
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            HStack(alignment: .center, content: {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture(perform: {
                        self.isSettingPresented.toggle()
                    })
                    .sheet(isPresented: $isSettingPresented, content: {
                        SettingsView()
                    })
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture(perform: {
                        self.isCreditsPresented.toggle()
                    })
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            })
        })
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(id: UUID(), text: "Hello, World!"), count: 5, index: 1)
    }
}
