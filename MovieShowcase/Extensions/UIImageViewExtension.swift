//
//  UIImageViewExtension.swift
//  MovieShowcase
//
//  Created by Vivek on 24/04/21.
//

import SDWebImage


extension UIImageView {
    
    func setImage(endPoint: String, size: ImageSize, placeholderImage: UIImage = #imageLiteral(resourceName: "movie_placeholder")) {
        let urlText = AppConfig.imageBasePath + size.rawValue + endPoint
        guard let imgUrl = URL(string: urlText) else {
            fatalError("Image url is not correct!")
        }
        self.sd_setImage(with: imgUrl, placeholderImage: placeholderImage)
    }
}
