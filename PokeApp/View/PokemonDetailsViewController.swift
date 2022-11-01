//
//  PokemonDetailsViewController.swift
//  PokeApp
//
//  Created by angel.tejedore on 31/10/22.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pokemonImageview: UIImageView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    
    private let viewModel = PokemonDetailsViewModel()
    public var pokemonDetails: PokemonDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPokemonImage(with: pokemonDetails?.id ?? 0)
        setupBinders()
        setupUIView()
        setupData()
    }
    
    func setupUIView() {
        bottomView.layer.cornerRadius = 20
        heightValueLabel.layer.borderWidth = 1
        heightValueLabel.layer.borderColor = UIColor.systemTeal.cgColor
        weightValueLabel.layer.borderWidth = 1
        weightValueLabel.layer.borderColor = UIColor.systemTeal.cgColor
    }
    
    func setupData() {
        guard let name = pokemonDetails?.name,
              let height = pokemonDetails?.height,
              let weight = pokemonDetails?.weight
        else { return }
        
        titleLabel.text = name.capitalized
        heightValueLabel.text = String(height) + " m"
        weightValueLabel.text = String(weight) + " kg"
    }
    
    
    func setupBinders() {
        viewModel.pokemonImage.bind { image in
            if let image = image {
                DispatchQueue.main.async {
                    self.progressIndicator.isHidden = true
                    self.pokemonImageview.image = image
                }
            }
        }
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true)
    }

}

