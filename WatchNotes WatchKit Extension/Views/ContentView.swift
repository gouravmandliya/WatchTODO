//
//  ContentView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Gourav on 03/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notes : [Note] = [Note]()
    @State private var text:String = ""
    
    @AppStorage("lineCount") var lineCount:Int = 1
    
    func getDocumentDirectory()->URL?{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path.first
    }
    
    func save() {
       // dump(notes)
        do{
            let data = try JSONEncoder().encode(notes)
            guard let url = self.getDocumentDirectory()?.appendingPathComponent("notes") else { return }
            try data.write(to: url)
        }
        catch
        {
            print("Saving date has failed.")
        }
    }
    
    func load()
    {
        DispatchQueue.main.async {
            do{
                guard let url = self.getDocumentDirectory() else {
                    return
                }
                let data = try Data(contentsOf: url)
                
                notes = try  JSONDecoder().decode([Note].self, from: data)
            }
            catch
            {
                
            }
        }
    }
    
    func delete(offset:IndexSet){
        withAnimation {
            notes.remove(atOffsets:offset)
            save()
        }
    }
    
    var body: some View {
        VStack
        {
            HStack(alignment: .center, spacing: 6, content: {
                TextField("Add New Note", text: $text)
                Button {
                    guard text.isEmpty == false else{ return }
                    let note  = Note(id: UUID(), text: text)
                    
                    notes.append(note)
                    text = ""
                }
                label :
                {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                       
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())

                .foregroundColor(.yellow)
            })
            if notes.count >= 1 {
                
            List{
                ForEach(0..<notes.count,id:\.self){
                    i in
            
                    NavigationLink(
                        destination: DetailView(note: notes[i], count: notes.count, index: i)){
                        HStack{
                            Capsule()
                                .frame(width:4)
                                .foregroundColor(.yellow)
                            Text(notes[i].text)
                                .foregroundColor(.white)
                                .lineLimit(lineCount)
                                .padding(.leading,5)
                        }
                    }
                }.onDelete(perform: { indexSet in
                    self.delete(offset: indexSet)
                })
            }
            }
            else
            {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                    
                Spacer()
            }
            
           
            
        }
        .navigationTitle("Notes")
        .onAppear(){
            self.load()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
