//
//  NextStepViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/19/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class NextStepViewController: UIViewController {
	
	@IBOutlet weak var nextStepTitleView: UIView!
	
	@IBOutlet weak var nextStepInst1: UIView!
	
	@IBOutlet weak var nextStepImageViewView: UIView!
	
	@IBOutlet weak var nextStepImageView: UIImageView!
	
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
		
		
		nextStepImageView.image = UIImage(named: "30")
		nextStepImageView.animationImages = nextButtonImageList
		nextStepImageView.startAnimating()
		
		
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		nextStepTitleView.alpha = 0
		nextStepInst1.alpha = 0
		nextStepImageViewView.alpha = 0
		fadeInView(view: nextStepTitleView)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.fadeInView(view: self.nextStepInst1)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.nextStepImageViewView)
				self.nextStepImageView.animationRepeatCount = 1
				self.nextStepImageView.animationDuration = 2
				
				self.animateImages()
				
				
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
