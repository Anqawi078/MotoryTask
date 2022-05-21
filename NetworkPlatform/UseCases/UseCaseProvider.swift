//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by khalil anqawi on 20/05/2022.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    
    private let networkProvider: NetworkProvider
    
    public init(){
        networkProvider = NetworkProvider()
    }
    
    public func makeHomeUseCase() -> Domain.HomeUseCase {
        return HomeUseCase(network: networkProvider.makeHomeNetwork())
    }
    
}
