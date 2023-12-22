//
//  Colors.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 16/08/2023.
//

import SwiftUI

enum SCColor {
    static let main = Color.init(uiColor: UIColor(red: 68 / 255, green: 152 / 255, blue: 164 / 255, alpha: 1.0))
    static let secondary = Color.init(uiColor: UIColor(red: 41 / 255, green: 14 / 255, blue: 5 / 255, alpha: 1.0))
    
    enum UI {
        static let tabBar = UIColor.lightGray.withAlphaComponent(0.05)
    }
}
