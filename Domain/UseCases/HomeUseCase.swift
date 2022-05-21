//
//  HomeUseCase.swift
//  Domain
//
//  Created by khalil anqawi on 20/05/2022.
//

import Foundation
import RxSwift

public protocol HomeUseCase {
    func HomeCategories() -> Observable<[HomeModel]>
 }


