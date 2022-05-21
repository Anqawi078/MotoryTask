//
//  HomeUseCase.swift
//  NetworkPlatform
//
//  Created by khalil anqawi on 20/05/2022.
//

import Foundation
import Domain
import RxSwift


final class  HomeUseCase : Domain.HomeUseCase {
    private let network: HomeNetwork
    
    init(network: HomeNetwork) {
        self.network = network
        
    }
    
    func HomeCategories() -> Observable<[HomeModel]> {
        return network.HomeCategories()
    }
    
}
