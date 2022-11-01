//
//  HomeViewController.swift
//  PokeApp
//
//  Created by angel.tejedore on 29/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    private let viewModel = PokemonViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadPokemonList()
        setupBinders()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.register(UINib(nibName: Constants.nibNameCell1, bundle: nil), forCellWithReuseIdentifier: Constants.pokemonCellIdentifier1)
        collectionView.register(UINib(nibName: Constants.nibNameCell2, bundle: nil), forCellWithReuseIdentifier: Constants.pokemonCellIdentifier2)
        
    }
    
    @IBAction func didChangeSegmentedControl(_ sender: UISegmentedControl) {
        collectionView.reloadData()
    }
    
    private func setupBinders() {
        viewModel.pokemonList.bind { [weak self] pokemons in
            if let _ = pokemons {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
        viewModel.pokemonDetails.bind { [weak self] pokemonDetails in
        
            guard let id = pokemonDetails?.id,
                  let name = pokemonDetails?.name,
                  let height = pokemonDetails?.height,
                  let weight = pokemonDetails?.weight
            else { return }
            
            let viewController = self?.storyboard?.instantiateViewController(withIdentifier: Constants.pokemonDetailsVCIdentifier) as! PokemonDetailsViewController
            viewController.pokemonDetails = PokemonDetails(id: id,
                                                           name: name,
                                                           height: height,
                                                           weight: weight)
            
            self?.present(viewController, animated: true)
        }
    }
}


extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        viewModel.getPokemonDetails(with: indexPath.row + 1)
        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonList.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemon = viewModel.pokemonList.value?[indexPath.row]
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.pokemonCellIdentifier1, for: indexPath) as! PokemonCellType1
            cell.setupCell(pokemon: pokemon, id: indexPath.row + 1)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.pokemonCellIdentifier2, for: indexPath) as! PokemonCellType2
        
        cell.setupCell(pokemon: pokemon, id: indexPath.row + 1)
        
        return cell
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfCellsPerRow = segmentedControl.selectedSegmentIndex == 0 ? 2 : 1
    
        let flowlayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowlayout.sectionInset.left + flowlayout.sectionInset.right + (flowlayout.minimumInteritemSpacing * CGFloat(numberOfCellsPerRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfCellsPerRow))
        
        let heightSize = segmentedControl.selectedSegmentIndex == 0 ? 200 : 160
        

        return CGSize(width: size, height: heightSize)
    }
}
