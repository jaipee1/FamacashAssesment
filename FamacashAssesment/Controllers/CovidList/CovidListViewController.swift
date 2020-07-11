//
//  ViewController.swift
//  FamacashAssesment
//
//  Created by jaipee on 10/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//

import UIKit

class CovidListViewController: ViewController {
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: String(describing: CovidDetailCollectionViewCell.self), bundle: nil)
            self.collectionView.register(nib, forCellWithReuseIdentifier: String(describing: CovidDetailCollectionViewCell.self))
            
            let nibCountry = UINib(nibName: String(describing: CovidCountryDetailCollectionViewCell.self), bundle: nil)
            self.collectionView.register(nibCountry, forCellWithReuseIdentifier: String(describing: CovidCountryDetailCollectionViewCell.self))
            
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
    }
    
    private var sectionDataSource: [[GlobalType]] = []
    
    // MARK: - Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getSummary()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setFlowLayout()
    }
    
    // MARK: - Set Flow Layout
    private func setFlowLayout() {
        self.view.layoutSubviews()
        let flowLayout = UICollectionViewFlowLayout()
        var size = (collectionView.frame.size.width - CGFloat(16))
        print(size)
        print(UIScreen.main.bounds.size.width)
        if UIDevice.current.userInterfaceIdiom == .pad {
            size = (collectionView.frame.size.width - CGFloat(32)) / CGFloat(2)
        }
        flowLayout.itemSize = CGSize(width: size, height: 300)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }

    // MARK: - Get Covid Summary
    private func getSummary() {
        self.startAnimating()
        NetworkManager<CovidSummary>.getCovidSummary { [weak self] (_summary, errorString) in
            self?.stopAnimating()
            guard let self = self else { return }
            if let summary = _summary {
                if let global = summary.global {
                    self.sectionDataSource.append([global])
                }
                
                if let allCountries = summary.countries {
                    self.sectionDataSource.append(allCountries)
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }else {
                print(errorString)
                DispatchQueue.main.async {
                    let alertVC = UIAlertController(title: "Alert", message: errorString, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertVC.addAction(okAction)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
    }

}

// MARK: - Collection View DataSource
extension CovidListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sectionDataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CovidDetailCollectionViewCell.self), for: indexPath) as! CovidDetailCollectionViewCell
            cell.layer.shouldRasterize = true;
            cell.layer.rasterizationScale = UIScreen.main.scale
            cell.configureCellWith(sectionDataSource[indexPath.section][indexPath.row])
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CovidCountryDetailCollectionViewCell.self), for: indexPath) as! CovidCountryDetailCollectionViewCell
            cell.layer.shouldRasterize = true;
            cell.layer.rasterizationScale = UIScreen.main.scale
            cell.configureCellWith(sectionDataSource[indexPath.section][indexPath.row])
            return cell
        }
    }
}

// MARK: - Collection View Delegate & Delegate Flowlayout
extension CovidListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if UIDevice.current.userInterfaceIdiom == .pad {
                 return CGSize(width: self.collectionView.frame.size.width, height: 200)
            }
            return CGSize(width: self.collectionView.frame.size.width, height: 300)
        }else {
            if UIDevice.current.userInterfaceIdiom == .pad {
                return CGSize(width: (self.collectionView.frame.size.width - 20) / 2, height: 220)
            }
            return CGSize(width: self.collectionView.frame.size.width - 16, height: 220)
        }
    }
}
