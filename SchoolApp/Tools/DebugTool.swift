//
//  DebugTool.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//

import Foundation

final class DebugTool {
    static func print(message: String, error: Error) {
        Swift.print("[DEBUG]: - \(message): \(error)")
    }
}
