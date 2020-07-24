//
//  ParentProtocol.swift
//  Challenge
//
//  Created by Sahar Hany on 7/24/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import Foundation
protocol ParentProtocol {
    func highlightCellAtIndexPath()
}

protocol ChildProtocol {
    var  vc : ParentProtocol? { get set }
    func setData(firstName: String , lastName: String)
}
