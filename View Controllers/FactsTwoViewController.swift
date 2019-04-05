//
//  FactsTwoViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/7/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class FactsTwoViewController: UIViewController {
    
    @IBOutlet weak var factsTwoTitleView: UIView!
    
    @IBOutlet weak var factsTwoSubtitleView: UIView!
    
    @IBOutlet weak var factsTwoDesc1View: UIView!
    
    @IBOutlet weak var factsTwoDesc2View: UIView!
	
    @IBOutlet weak var factsTwoImageViewView: UIView!
    
    @IBOutlet weak var factsTwoImageView: UIImageView!
	
	func fadeInView(view: UIView) {
		let animationDuration = 0.5
		UIView.animate(withDuration: animationDuration, animations: { () -> Void in view.alpha = 1})
	}
	
	
	
	func animateImages() {
		var nextButtonImageList:[UIImage] = []
		for i in 1...30
		{
			
			let imageName:String = "\(i)"
			let img = UIImage(named: imageName)
			nextButtonImageList.append(img!)
		}
		
		factsTwoImageView.image = UIImage(named: "30")
		factsTwoImageView.animationImages = nextButtonImageList
		factsTwoImageView.startAnimating()
		
		
		
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()
		factsTwoTitleView.alpha = 0
		factsTwoSubtitleView.alpha = 0
		factsTwoDesc1View.alpha = 0
		factsTwoDesc2View.alpha = 0
		factsTwoImageViewView.alpha = 0
		fadeInView(view: factsTwoTitleView)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.fadeInView(view: self.factsTwoSubtitleView)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.factsTwoDesc1View)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.factsTwoDesc2View)
					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
						self.fadeInView(view: self.factsTwoImageViewView)
						self.factsTwoImageView.animationRepeatCount = 1
						self.factsTwoImageView.animationDuration = 2
						
							self.animateImages()
					}
				}
			}
		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
			self.performSegue(withIdentifier: "3", sender: nil)
		}
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
