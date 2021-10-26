//
//  RegisterViewModel.swift
//  NextFlix
//
//  Created by Gui Feitosa on 21/10/21.
//

import Foundation
import UIKit

protocol RegisterViewModelDelegate {
    func registerResult(register: Register)
}

class RegisterViewModel {
    
    var delegate: RegisterViewModelDelegate?
    
    func registro(register: Register) {
        delegate?.registerResult(register: register)
    }
}
