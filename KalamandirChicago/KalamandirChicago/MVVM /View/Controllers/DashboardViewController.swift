//
//  ViewController.swift
//  KalamandirChicago
//
//  Created by Varshitha VRaj on 01/09/25.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    private let viewModel = DashboardViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("the view just appeared")
        viewModel.loadMore()
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
    }


}

//extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//}


