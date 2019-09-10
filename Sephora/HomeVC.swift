//
//  HomeVC.swift
//  Sephora
//
//  Created by Keyur on 24/07/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var headerTitleLbl: Label!
    @IBOutlet weak var productCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Register xib
        productCV.register(UINib.init(nibName: "CustomProductCVC", bundle: nil), forCellWithReuseIdentifier: "CustomProductCVC")
        
        //get product data from json file
        getProductData()
    }
    
    func getProductData()
    {
        let tempData : CategoryModel = getAllProdyctData()
        AppModel.shared.categoryData = CategoryModel.init()
        AppModel.shared.categoryData = tempData
        setProductImage(headerImgView, AppModel.shared.categoryData.banner)
        headerTitleLbl.text = AppModel.shared.categoryData.subheader
        AppModel.shared.allProduct = AppModel.shared.categoryData.slots
        productCV.reloadData()
    }

    //MARK:- Collectionview method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppModel.shared.allProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/3
        let height = (width*180/150) + 10
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomProductCVC = productCV.dequeueReusableCell(withReuseIdentifier: "CustomProductCVC", for: indexPath) as! CustomProductCVC
        let dict = AppModel.shared.allProduct[indexPath.row]
        setProductImage(cell.productImgView, dict.image_url)
        cell.productNameLbl.text = dict.name
        cell.constraintHeightOuterView.constant = (collectionView.frame.size.width/3) - 20
        if dict.new_arrival == "true" {
            cell.newView.isHidden = false
        }else{
            cell.newView.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CustomProductCVC {
                cell.outerView.transform = .init(scaleX: 0.95, y: 0.95)
                cell.outerView.layer.borderColor = AppColor.cgColor
                cell.outerView.layer.borderWidth = 2
                cell.productNameLbl.textColor = AppColor
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CustomProductCVC {
                cell.outerView.transform = .identity
                cell.outerView.layer.borderColor = WhiteColor.cgColor
                cell.outerView.layer.borderWidth = 2
                cell.productNameLbl.textColor = DarkGrayColor
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc : ProductDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        vc.selectedProduct = AppModel.shared.allProduct[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

