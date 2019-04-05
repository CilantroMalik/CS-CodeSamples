//
//  Congrats1ViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/18/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class Congrats1ViewController: UIViewController {

	@IBOutlet weak var congrats1TitleView: UIView!
	
	@IBOutlet weak var congrats1Desc1: UIView!
	
	@IBOutlet weak var congrats1Inst1: UIView!
	
	@IBOutlet weak var congrats1ImageViewView: UIView!
	
	@IBOutlet weak var congrats1ImageView: UIImageView!
	
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
		
		
		congrats1ImageView.image = UIImage(named: "30")
		congrats1ImageView.animationImages = nextButtonImageList
		congrats1ImageView.startAnimating()
		
		
		
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		congrats1TitleView.alpha = 0
		congrats1Desc1.alpha = 0
		congrats1Inst1.alpha = 0
		congrats1ImageViewView.alpha = 0
		fadeInView(view: congrats1TitleView)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.fadeInView(view: self.congrats1Desc1)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.congrats1Inst1)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.congrats1ImageViewView)
					self.congrats1ImageView.animationRepeatCount = 1
					self.congrats1ImageView.animationDuration = 2
					
					self.animateImages()
				}
			}
		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
			self.fadeInView(view: self.congrats1TitleView)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.congrats1Desc1)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.congrats1Inst1)
					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
						self.fadeInView(view: self.congrats1ImageViewView)
						self.congrats1ImageView.animationRepeatCount = 1
						self.congrats1ImageView.animationDuration = 2
						
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
