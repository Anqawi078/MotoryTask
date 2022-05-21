//
//  MainVC.swift
//  MotoryTask
//
//  Created by khalil anqawi on 21/05/2022.
//

import UIKit
import RxSwift
import RxCocoa
import NetworkPlatform
import Domain
class MainVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imagesBttn: UIButton!
    @IBOutlet weak var favouriteBttn: UIButton!
    @IBOutlet weak var gridBttn: UIButton!
    @IBOutlet weak var listBttn: UIButton!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    var viewModel : MainVM!
    let bag = DisposeBag()
    var isGrad = false
    var allImages = BehaviorSubject<[HomeModel]>(value: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        preparation()
        categorySetUp()
        buttonsSetUp()
        searchSetUp()
    }
    
    func categorySetUp(){
        imagesCollectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        self.imagesCollectionView.rx.setDelegate(self).disposed(by: bag)
        self.viewModel.categoriesSubject.bind(to: imagesCollectionView.rx.items(dataSource: self.viewModel.dataSource())).disposed(by: bag)
    }
    
    func preparation() {
        let networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
        viewModel = MainVM(homeUseCase: networkUseCaseProvider.makeHomeUseCase())
        
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = MainVM.Input(trigger: viewWillAppear)
        let output = viewModel.transform(input: input)
        
        output.home.asObservable().subscribe(onNext: { (catalog) in
            self.allImages.onNext(catalog)
            self.viewModel.categoriesSubject.onNext([HomeSection(header: "", items: catalog )])
        }).disposed(by: bag)
    }
    
    func buttonsSetUp() {
        gridBttn.rx.tap.asObservable().subscribe(onNext: {(void) in
            self.isGrad = false
            self.imagesCollectionView.reloadData()
            self.gridBttn.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.listBttn.tintColor = #colorLiteral(red: 0.5366379023, green: 0.5615909696, blue: 0.5826315284, alpha: 1)
        }).disposed(by: bag)
        
        listBttn.rx.tap.asObservable().subscribe(onNext: {(void) in
            self.isGrad = true
            self.imagesCollectionView.reloadData()
            self.gridBttn.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
            self.listBttn.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }).disposed(by: bag)
        
        
        imagesBttn.rx.tap.asObservable().subscribe(onNext: {(void) in
            guard let images = try? self.allImages.value() else {return}
            self.imagesBttn.backgroundColor = #colorLiteral(red: 0.1132211015, green: 0.6089417934, blue: 0.9398133159, alpha: 1)
            self.favouriteBttn.backgroundColor = #colorLiteral(red: 0.1400716007, green: 0.2017243207, blue: 0.2517734766, alpha: 1)
            self.viewModel.categoriesSubject.onNext([HomeSection(header: "", items: images )])
        }).disposed(by: bag)
        
        favouriteBttn.rx.tap.asObservable().subscribe(onNext: {(void) in
            guard let favouriteImages = try? self.viewModel.favouriteImages.value() else {return}
            self.imagesBttn.backgroundColor = #colorLiteral(red: 0.1400716007, green: 0.2017243207, blue: 0.2517734766, alpha: 1)
            self.favouriteBttn.backgroundColor = #colorLiteral(red: 0.1132211015, green: 0.6089417934, blue: 0.9398133159, alpha: 1)
            self.viewModel.categoriesSubject.onNext([HomeSection(header: "", items: favouriteImages )])
        }).disposed(by: bag)
        
    }
    
    func searchSetUp() {
        searchBar.rx.searchButtonClicked.subscribe(onNext: { [self](void) in
            guard var images = try? self.allImages.value() else {return}
           if (self.searchBar.text ?? "").count > 0 {
               images = images.filter { (images: HomeModel) -> Bool in
                   return (images.id ?? "").lowercased().contains((searchBar.text ?? "").lowercased())
            }
            self.viewModel.categoriesSubject.onNext([HomeSection(header: "", items: images)])

           } else {
               self.viewModel.categoriesSubject.onNext([HomeSection(header: "", items: images)])
           }
           self.view.endEditing(true)
        }).disposed(by: bag)
    }
    
}

extension MainVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.isGrad == false {
            return CGSize(width: collectionView.bounds.width  - 16 , height: (collectionView.bounds.height / 2) - 20)
        } else {
            return CGSize(width: (collectionView.bounds.width / 2)  - 16 , height: (collectionView.bounds.height / 2) - 20)
        }
    }
}
