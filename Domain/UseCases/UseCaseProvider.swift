//
//  UseCaseProvider.swift
//  Domain
//
//  Created by khalil anqawi on 20/05/2022.
//

import Foundation

public protocol UseCaseProvider {
    func makeHomeUseCase() -> Domain.HomeUseCase
}
