//
//  UIImageViewEX.swift
//  MotoryTask
//
//  Created by khalil anqawi on 21/05/2022.
//

import Foundation
import Kingfisher
import Domain
extension UIImageView {
    
    func downloadImageInCellWithoutCorner(urlString : String){
        let url = URL(string: (urlString))

        let size = CGSize(width: self.bounds.size.width , height: self.bounds.size.height)

        let processor = DownsamplingImageProcessor(size: size)
           self.kf.indicatorType = .activity
           
            self.kf.setImage(
               with: url,
               placeholder: UIImage(named: "placeholder"),
               options: [
                   .processor(processor),
                   .scaleFactor(UIScreen.main.scale),
                   .transition(.fade(1)),
                   .cacheOriginalImage
               ], completionHandler:
                {
                    result in
                    switch result {
                    case .success(_):
                        break
                    case .failure(_):
                        break
                    }
                })

           
       }
    
    func enableZoom() {
      let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
      isUserInteractionEnabled = true
      addGestureRecognizer(pinchGesture)
    }

    @objc
    private func startZooming(_ sender: UIPinchGestureRecognizer) {
      let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
      guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
      sender.view?.transform = scale
      sender.scale = 1
    }
}

