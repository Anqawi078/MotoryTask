//
//  HomeNetwork.swift
//  NetworkPlatform
//
//  Created by khalil anqawi on 20/05/2022.
//

import Foundation
import Domain
import RxSwift

public final class HomeNetwork {
    private let network: Network<[HomeModel]>
    init(network: Network<[HomeModel]>) {
        self.network = network
    }
    public func HomeCategories() -> Observable<[HomeModel]>{
        return network.getItems("photos/?client_id=xFWdYyWUvZBxf82WMknBpJLr41YGkq4EZdxjPR0JFUc")
    }
}
