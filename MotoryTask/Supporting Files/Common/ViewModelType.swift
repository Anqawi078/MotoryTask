//
//  ViewModelType.swift
//  MotoryTask
//
//  Created by khalil anqawi on 21/05/2022.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
    
}
