//
//  HomeSection.swift
//  MotoryTask
//
//  Created by khalil anqawi on 21/05/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Domain

struct HomeSection {
    var header: String
    var items : [Item]
}

extension HomeSection: AnimatableSectionModelType ,Equatable{
    
    typealias Item = HomeModel
    var identity: String{
        return header
    }
    init(original: HomeSection, items: [HomeModel]) {
        self = original
        self.items = items
    }

    
}

extension HomeModel: IdentifiableType , Equatable {
    public var identity: String {
        return id ?? ""
    }
    public static func == (lhs: HomeModel, rhs: HomeModel) -> Bool {
        return  lhs.id  == rhs.id
       
    }
}
