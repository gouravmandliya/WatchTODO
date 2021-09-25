//
//  Note.swift
//  WatchNotes WatchKit Extension
//
//  Created by Gourav on 03/07/21.
//

import Foundation

struct Note:Identifiable,Codable {
    let id :UUID
    let text : String
}
