//
//  PokemonCell.swift
//  PokeApp
//
//  Created by angel.tejedore on 30/10/22.
//

import UIKit
import Alamofire

class PokemonCellType1: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView1: UIImageView!
    @IBOutlet weak var cellLabel1: UILabel!
    @IBOutlet weak var cellView1: UIView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func setupCell(pokemon: Pokemon?, id: Int) {
        cellView1.layer.cornerRadius = 20
        cellView1.layer.shadowRadius = 5.0
        cellView1.layer.shadowOpacity = 0.3
        cellView1.layer.shadowColor = UIColor.black.cgColor
        cellView1.layer.shadowOffset = CGSize(width: 3, height: 10)
        
        guard let pokemon = pokemon else { return }
        cellLabel1.text = pokemon.name.capitalized
        cellImageView1.loadFrom(with: id)
        progressIndicator.stopAnimating()
    }
}


