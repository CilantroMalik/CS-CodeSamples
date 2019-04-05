//
//  AlmostViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/19/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class AlmostViewController: UIViewController {
	
	@IBOutlet weak var almostTitleView: UIView!
	
	@IBOutlet weak var almostSubtitleView: UIView!
	
	@IBOutlet weak var almostInst1: UIView!
	
	@IBOutlet weak var almostImageViewView: UIView!
	
	@IBOutlet weak var almostImageView: UIImageView!
	
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
		
		
		almostImageView.image = UIImage(named: "30")
		almostImageView.animationImages = nextButtonImageList
		almostImageView.startAnimating()
		
		
		
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		HubViewController.completions.outsidePressed = true
		almostTitleView.alpha = 0
		almostInst1.alpha = 0
		almostSubtitleView.alpha = 0
		almostImageViewView.alpha = 0
		fadeInView(view: almostTitleView)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.fadeInView(view: self.almostSubtitleView)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.almostInst1)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.almostImageViewView)
					self.almostImageView.animationRepeatCount = 1
					self.almostImageView.animationDuration = 2
					
					self.animateImages()
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
