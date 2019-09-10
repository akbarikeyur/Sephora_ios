//
//  SplashScreenVC.swift
//  Sephora
//
//  Created by Keyur on 25/07/19.
//  Copyright © 2019 Keyur. All rights reserved.
//

import UIKit
import Lottie

class SplashScreenVC: UIViewController {

    @IBOutlet weak var splashView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setSplashAnimation()
    }
    
    func setSplashAnimation()
    {
        let animationView = AnimationView(name: "lipstick")
        animationView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        splashView.addSubview(animationView)
        animationView.play()
        
        delay(3.0) {
            let vc : HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
