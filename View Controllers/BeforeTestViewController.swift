//
//  BeforeTestViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/17/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class BeforeTestViewController: UIViewController {
	
	@IBOutlet weak var beforeTestTitleView: UIView!
	
	@IBOutlet weak var beforeTestInst1: UIView!
	
	@IBOutlet weak var beforeTestInst2: UIView!
	
	@IBOutlet weak var beforeTestImageViewView: UIView!
	
	@IBOutlet weak var beforeTestImageView: UIImageView!
	
	
	@IBAction func nextButtonBeforeTest(_ sender: UIButton) {
		HubViewController.completions.toiletPressed = true
	}
	
	
	func fadeInView(view: UIView) {
		let animationDuration = 0.5
		UIView.animate(withDuration: animationDuration, animations: { () -> Void in view.alpha = 1})
	}
	
	func fadeInImageView(imageView: UIImageView) {
		let animationDuration = 0.5
		UIImageView.animate(withDuration: animationDuration, animations: { () -> Void in imageView.alpha = 1})
	}
	
	func animateImages() {
		var nextButtonImageList:[UIImage] = []
		for i in 1...30
		{
			let imageName:String = "\(i)"
			let img = UIImage(named: imageName)
			nextButtonImageList.append(img!)
		}
		
		
		beforeTestImageView.image = UIImage(named: "30")
		beforeTestImageView.animationImages = nextButtonImageList
		beforeTestImageView.startAnimating()
		
		
		
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		beforeTestTitleView.alpha = 0
		beforeTestInst1.alpha = 0
		beforeTestInst2.alpha = 0
		beforeTestImageViewView.alpha = 0
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.fadeInView(view: self.beforeTestTitleView)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.beforeTestInst1)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.beforeTestInst2)
					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
						self.fadeInView(view: self.beforeTestImageViewView)
						self.beforeTestImageView.animationRepeatCount = 1
						self.beforeTestImageView.animationDuration = 2
					
						self.animateImages()
					}
				}
			}
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
