//
//  UIImageView+Extension.swift
//  PokeApp
//
//  Created by angel.tejedore on 31/10/22.
//

import UIKit
import Alamofire


extension UIImageView {
    
    func loadFrom(with id: Int) {
        let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
        AF.download(url).responseURL { response in
            if response.error == nil, let imagePath = response.fileURL?.path {
                let image = UIImage(contentsOfFile: imagePath)
                self.image = image
            }
            
        }
    }
}
