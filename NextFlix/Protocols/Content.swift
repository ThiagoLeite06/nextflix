//
//  Content.swift
//  NextFlix
//
//  Created by Gui Feitosa on 05/11/21.
//

import Foundation

protocol Content {
    var title: String {get}
    var cover: URL? {get}
    var overview: String {get}
}
