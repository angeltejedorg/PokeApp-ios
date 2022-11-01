//
//  PokemonCellType2.swift
//  PokeApp
//
//  Created by angel.tejedore on 30/10/22.
//

import UIKit

class PokemonCellType2: UICollectionViewCell {

    @IBOutlet weak var cellImageView2: UIImageView!
    @IBOutlet weak var cellLabel2: UILabel!
    
    @IBOutlet weak var cellView2: UIView!
    
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func setupCell(pokemon: Pokemon?, id: Int) {
        

        cellView2.layer.cornerRadius = 20
        cellView2.layer.shadowRadius = 5
        cellView2.layer.shadowOpacity = 0.3
        cellView2.layer.shadowColor = UIColor.black.cgColor
        cellView2.layer.shadowOffset = CGSize(width: 10, height: 10)

        
        guard let pokemon = pokemon else { return }
        cellLabel2.text = pokemon.name.capitalized
        cellImageView2.loadFrom(with: id)
        progressIndicator.stopAnimating()
    }
}
