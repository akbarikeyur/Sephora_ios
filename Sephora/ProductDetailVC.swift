//
//  ProductDetailVC.swift
//  Sephora
//
//  Created by Keyur on 25/07/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit
import Lottie

class ProductDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var productDescLbl: Label!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productNameLbl: Label!
    @IBOutlet weak var productHeadingLbl: Label!
    @IBOutlet weak var brandLbl: Label!
    @IBOutlet weak var priceLbl: Label!
    @IBOutlet weak var starView: FloatRatingView!
    @IBOutlet weak var addToBagBtn: Button!
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var offerBtn: Button!
    @IBOutlet weak var cartLbl: Label!
    @IBOutlet weak var bestSellerView: UIView!
    @IBOutlet weak var productCV: UICollectionView!
    @IBOutlet weak var constraintHeightProductCV: NSLayoutConstraint!
    @IBOutlet weak var exclusiveBtn: Button!
    @IBOutlet weak var relatedItemView: UIView!
    
    var selectedProduct : ProductModel = ProductModel.init()
    var arrRelatedProduct : [ProductModel] = [ProductModel]()
    let animationView = AnimationView(name: "add_cart")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Register Xib
        productCV.register(UINib.init(nibName: "CustomProductCVC", bundle: nil), forCellWithReuseIdentifier: "CustomProductCVC")
        
        setupUIDesigning()
        getProductData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        delay(0.5) {
            self.animationView.frame = CGRect(x: 0, y: -25, width: self.cartView.frame.size.width, height: self.cartView.frame.size.height + 50)
            self.cartView.addSubview(self.animationView)
        }
        
    }
    
    //MARK:- Setup UI and data
    func setupUIDesigning()
    {
        if AppModel.shared.total_cart == 0 {
            cartLbl.isHidden = true
        }else{
            cartLbl.isHidden = false
            cartLbl.text = String(AppModel.shared.total_cart)
        }
        //Rotate button
        offerBtn.transform = CGAffineTransform(rotationAngle: CGFloat(-0.5.squareRoot()+0.3))
        exclusiveBtn.transform = CGAffineTransform(rotationAngle: CGFloat(-0.5.squareRoot()))
        //Set round corner
        bestSellerView.roundCorners(corners: [.bottomRight, .topLeft], radius: 15)
    }
    
    func getProductData()
    {
        setProductImage(headerImgView, AppModel.shared.categoryData.banner)
        arrRelatedProduct = AppModel.shared.categoryData.slots
        setProductDetail()
    }
    
    //MARK:- Setup product detail
    func setProductDetail()
    {
        productDescLbl.text = selectedProduct.desc
        setProductImage(productImg, selectedProduct.image_url)
        productNameLbl.text = selectedProduct.name
        if selectedProduct.variant != "" && productNameLbl.text != ""
        {
            productNameLbl.text = productNameLbl.text! + "(" + selectedProduct.variant + ")"
        }
        productHeadingLbl.text = selectedProduct.product_heading
        brandLbl.text = selectedProduct.brand
        starView.rating = Double(selectedProduct.rating) ?? 0.0
        priceLbl.text = selectedProduct.currency_symbol + " " + selectedProduct.dy_display_price
        offerBtn.isHidden = true
        if selectedProduct.crossed_price != "" {
            let crossed_price = selectedProduct.currency_symbol + " " + selectedProduct.crossed_price
            priceLbl.text = crossed_price + " " + priceLbl.text!
            let attributedString = NSMutableAttributedString(string: priceLbl.text!)
            let range = (priceLbl.text! as NSString).range(of: crossed_price)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: range)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: LightGrayColor, range: range)
            priceLbl.attributedText = attributedString
            
            if selectedProduct.sale_text != ""
            {
                let sale = selectedProduct.sale_text.replacingOccurrences(of: " ", with: "\n")
                offerBtn.setTitle(sale, for: .normal)
                offerBtn.isHidden = false
            }
        }
        
        if selectedProduct.in_stock == "false" && (selectedProduct.inventory == "0" || selectedProduct.inventory == "")
        {
            addToBagBtn.setTitle("OUT OF STOCK", for: .normal)
            addToBagBtn.isUserInteractionEnabled = false
            addToBagBtn.backgroundColor = LightGrayColor
            addToBagBtn.titleLabel?.textColor = DarkGrayColor
        }else{
            addToBagBtn.setTitle("ADD TO BAG", for: .normal)
            addToBagBtn.isUserInteractionEnabled = true
            addToBagBtn.backgroundColor = HighlightRedColor
            addToBagBtn.titleLabel?.textColor = WhiteColor
        }
        
        bestSellerView.isHidden = (selectedProduct.bestseller == "false")
        exclusiveBtn.isHidden = (selectedProduct.app_exclusive == "false")
        
        arrRelatedProduct = [ProductModel]()
        for tempCategory in selectedProduct.categories {
            for tempProduct in AppModel.shared.allProduct {
                if tempProduct.product_id != selectedProduct.product_id {
                    let index = arrRelatedProduct.firstIndex { (temp) -> Bool in
                        temp.product_id == tempProduct.product_id
                    }
                    if index == nil {
                        if tempProduct.categories.contains(tempCategory)
                        {
                            arrRelatedProduct.append(tempProduct)
                        }
                    }
                }
            }
        }
        productCV.reloadData()
        relatedItemView.isHidden = (arrRelatedProduct.count == 0)
    }
    
    //MARK:- Button click event
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickToProductImage(_ sender: Any) {
        displayFullImage([selectedProduct.image_url], 0)
    }
    
    @IBAction func clickToBrand(_ sender: Any) {
        openUrlInSafari(strUrl: selectedProduct.brand_url)
    }
    
    @IBAction func clickToAddToBag(_ sender: UIButton) {
        if addToBagBtn.titleLabel?.text == "ADD TO BAG" {
            UIView.transition(with: sender, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.addToBagBtn.setTitle("ADDING...", for: .normal)
                self.AddToCartAnimation()
            }) { (isCompleted) in
                delay(1.0, closure: {

                })
            }
        }
    }
    
    //MARK:- Add to cart
    func AddToCartAnimation()
    {
        cartView.isHidden = false
        cartLbl.isHidden = false
        animationView.play()
        
        UIView.transition(with: cartLbl, duration: 0.1, options: .transitionCrossDissolve, animations: {
            AppModel.shared.total_cart += 1
            self.cartLbl.text = String(AppModel.shared.total_cart)
        })
        animationView.play { (isDone) in
            self.addToBagBtn.setTitle("ADD TO BAG", for: .normal)
            self.animationView.stop()
            self.cartView.isHidden = true
            self.updateProductInventory()
        }
    }
    
    //update cart value
    func updateProductInventory()
    {
        if selectedProduct.inventory != ""
        {
            var current_inventory : Int = Int(selectedProduct.inventory)!
            if current_inventory > 0 {
                current_inventory -= 1
                selectedProduct.inventory = String(current_inventory)
                
                if current_inventory == 0 {
                    addToBagBtn.setTitle("OUT OF STOCK", for: .normal)
                    addToBagBtn.isUserInteractionEnabled = false
                    addToBagBtn.backgroundColor = LightGrayColor
                    addToBagBtn.titleLabel?.textColor = DarkGrayColor
                    selectedProduct.in_stock = "false"
                }
                let index = AppModel.shared.allProduct.firstIndex { (temp) -> Bool in
                    temp.product_id == selectedProduct.product_id
                }
                if index != nil
                {
                    AppModel.shared.allProduct[index!] = selectedProduct
                }
            }
        }
    }
    
    //MARK:- Collectionview method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrRelatedProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        constraintHeightProductCV.constant = 180
        return CGSize(width: 150, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomProductCVC = productCV.dequeueReusableCell(withReuseIdentifier: "CustomProductCVC", for: indexPath) as! CustomProductCVC
        let dict = arrRelatedProduct[indexPath.row]
        setProductImage(cell.productImgView, dict.image_url)
        cell.productNameLbl.text = dict.name
        
        if dict.new_arrival == "true" {
            cell.newView.isHidden = false
        }else{
            cell.newView.isHidden = true
        }
        cell.constraintHeightOuterView.constant = 120
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedProduct = arrRelatedProduct[indexPath.row]
        setProductDetail()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
