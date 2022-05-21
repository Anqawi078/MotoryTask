//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by khalil anqawi on 20/05/2022.
//

import Domain
import KeychainSwift

final class NetworkProvider {

    private let apiEndpoint: String
    
    public init() {
       let _ =  Environment.shared
       
            apiEndpoint = "https://api.unsplash.com"
    }
    
    public func makeHomeNetwork() -> HomeNetwork{
        let  network = Network<[HomeModel]>(apiEndpoint)
        return HomeNetwork(network: network)
    }
}
