//
//  FinalViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/19/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit
import Firebase


class FinalViewController: UIViewController {
    struct userRefs {
        static var ref = Database.database().reference().child("Users").childByAutoId()
    }
	@IBOutlet weak var finalTitleView: UIView!
	
	@IBOutlet weak var finalInst1: UIView!
	
	@IBOutlet weak var finalQuestionView: UIView!
	
	@IBOutlet weak var finalYesImageViewView: UIView!
	
	@IBOutlet weak var finalNoImageViewView: UIView!
	
	@IBOutlet weak var finalYesImageView: UIImageView!
	
	@IBOutlet weak var finalNoImageView: UIImageView!
	
	
	@IBAction func didPressNo(_ sender: UIButton) {
        //let newRef = ref.child("Users").childByAutoId()
		HubViewController.foundLeaks.toiletLeak = false
	}
	
	@IBAction func didPressYes(_ sender: UIButton) {
		HubViewController.foundLeaks.toiletLeak = true
	}
	
	

	func fadeInView(view: UIView) {
		let animationDuration = 0.5
		UIView.animate(withDuration: animationDuration, animations: { () -> Void in view.alpha = 1})
	}
	
	func animateImagesYes() {
		var nextButtonImageList:[UIImage] = []
		for i in 31...61
		{
			let imageName:String = "\(i)"
			let img = UIImage(named: imageName)
			nextButtonImageList.append(img!)
		}
		
		
		finalYesImageView.image = UIImage(named: "61")
		finalYesImageView.animationImages = nextButtonImageList
		finalYesImageView.startAnimating()
		
		
		
	}
	
	func animateImagesNo() {
		var nextButtonImageList:[UIImage] = []
		for i in 62...92
		{
			let imageName:String = "\(i)"
			let img = UIImage(named: imageName)
			nextButtonImageList.append(img!)
		}
		
		
		finalNoImageView.image = UIImage(named: "92")
		finalNoImageView.animationImages = nextButtonImageList
		finalNoImageView.startAnimating()
		
		
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		HubViewController.completions.lastStepPressed = true
		finalTitleView.alpha = 0
		finalInst1.alpha = 0
		finalQuestionView.alpha = 0
		finalYesImageViewView.alpha = 0
		finalNoImageViewView.alpha = 0
		fadeInView(view: finalTitleView)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.fadeInView(view: self.finalInst1)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.finalQuestionView)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.finalYesImageViewView)
					self.fadeInView(view: self.finalNoImageViewView)
					self.finalYesImageView.animationRepeatCount = 1
					self.finalYesImageView.animationDuration = 2
					
					self.animateImagesYes()
					
					self.finalNoImageView.animationRepeatCount = 1
					
					self.finalNoImageView.animationDuration = 2
					
					self.animateImagesNo()
					
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
