//
//  HomeCell.swift
//  MotoryTask
//
//  Created by khalil anqawi on 21/05/2022.
//

import UIKit
import RxSwift
import RxCocoa
import NetworkPlatform
import Domain

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var wishListView: UIView!
    @IBOutlet weak var wishListBttn: UIButton!
    @IBOutlet weak var wishListimage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    var bag = DisposeBag()
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImage.enableZoom()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.bag = DisposeBag()
        
    }
}


