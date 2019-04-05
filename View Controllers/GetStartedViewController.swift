//
//  GetStartedViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/17/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

	@IBOutlet weak var getStartedTitleView: UIView!
	
	@IBOutlet weak var getStartedInst1: UIView!
	
	@IBOutlet weak var getStartedInst2: UIView!
	
	@IBOutlet weak var getStartedImageViewView: UIView!
	
	@IBOutlet weak var getStartedImageView: UIImageView!
	
	
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
		
		
		getStartedImageView.image = UIImage(named: "30")
		getStartedImageView.animationImages = nextButtonImageList
		getStartedImageView.startAnimating()
		
		
		
	}
	
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		getStartedTitleView.alpha = 0
		getStartedInst1.alpha = 0
		getStartedInst2.alpha = 0
		getStartedImageViewView.alpha = 0
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.fadeInView(view: self.getStartedTitleView)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.getStartedInst1)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.getStartedInst2)
					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
						self.fadeInView(view: self.getStartedImageViewView)
						self.getStartedImageView.animationRepeatCount = 1
						self.getStartedImageView.animationDuration = 2
					
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
