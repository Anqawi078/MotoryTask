//
//  MainVM.swift
//  MotoryTask
//
//  Created by khalil anqawi on 21/05/2022.
//

import Foundation
import RxSwift
import RxCocoa
import Domain
import RxDataSources

class MainVM : ViewModelType{
    var categoriesSubject = BehaviorSubject<[HomeSection]>(value: [HomeSection(header: "", items: [])])
    var favouriteImages = BehaviorSubject<[HomeModel]>(value: [])
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        let home: Driver<[HomeModel]>
        let error: Driver<Error>

    }
    private let homeUseCase : HomeUseCase
    
    init(homeUseCase : HomeUseCase ) {
        self.homeUseCase = homeUseCase
    }
    
    func transform(input : Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let home = input.trigger.flatMapLatest{ (void) in
            return self.homeUseCase.HomeCategories()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        }
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        
     return Output(fetching: fetching, home: home, error: errors)
    }
    
    func dataSource() -> RxCollectionViewSectionedAnimatedDataSource<HomeSection> {
        return RxCollectionViewSectionedAnimatedDataSource<HomeSection>(animationConfiguration: AnimationConfiguration(insertAnimation: .left, reloadAnimation: .bottom, deleteAnimation: .top),configureCell: { ds, cv, indexPath, item in

            guard let cell = cv.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
                return UICollectionViewCell()
            }
            cell.titleLbl.text = item.altDescription ?? "title"
            cell.descriptionLbl.text = item.homeModelDescription ?? "Description"
            cell.mainImage.downloadImageInCellWithoutCorner(urlString: item.urls?.full ?? "")
            
            if item.likedByUser == false {
                cell.wishListimage.tintColor =   #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.wishListView.backgroundColor =   #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
            } else {
                cell.wishListimage.tintColor =   #colorLiteral(red: 0.9998307824, green: 0.0485752672, blue: 0.04175616801, alpha: 1)
                cell.wishListView.backgroundColor =   #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            }
            
            cell.wishListBttn.rx.tap.subscribe(onNext: {(void) in
                guard var images = try? self.favouriteImages.value() else {return}
                if item.likedByUser == false {
                    item.likedByUser = true
                    cell.wishListimage.tintColor =   #colorLiteral(red: 0.9998307824, green: 0.0485752672, blue: 0.04175616801, alpha: 1)
                    cell.wishListView.backgroundColor =   #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    images.append(item)
                    self.favouriteImages.onNext(images)
                } else {
                    item.likedByUser = false
                    cell.wishListimage.tintColor =   #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    cell.wishListView.backgroundColor =   #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
                    images.removeAll { image in
                        (image.id ?? "") == item.id
                    }
                    self.favouriteImages.onNext(images)
                }
                
            }).disposed(by: cell.bag)
            return cell

        })
    }
}

