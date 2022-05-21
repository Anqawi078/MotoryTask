//
//  Data.swift
//  NetworkPlatform
//
//  Created by khalil anqawi on 20/05/2022.
//

import Foundation
extension Data{
    func printData<T>(_ type: T.Type){
    print("========== \(type.self) ============")
    print("========== Success ============")
    print(String(decoding: self, as: UTF8.self))
    print("========== End ============")

    }
    
    func printData(){
    print("========== Success ============")
    print(String(decoding: self, as: UTF8.self))
    print("========== End ============")

    }

}
