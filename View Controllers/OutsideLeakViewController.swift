//
//  OutsideLeakViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 12/18/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class OutsideLeakViewController: UIViewController {
	
	@IBOutlet weak var outsideLeakTitle: UIView!
	
	@IBOutlet weak var outsideImage: UIView!
	
	@IBOutlet weak var waterImage: UIView!
	
	@IBOutlet weak var yesImage: UIView!
	
	@IBOutlet weak var noImage: UIView!
	
	@IBAction func yesButton(_ sender: UIButton) {
		HubViewController.foundLeaks.outsideLeak = true
	}
	
	@IBAction func noButton(_ sender: UIButton) {
		HubViewController.foundLeaks.outsideLeak = false
	}
	
	func fadeInView(view: UIView) {
		let animationDuration = 0.5
		UIView.animate(withDuration: animationDuration, animations: { () -> Void in view.alpha = 1})
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		HubViewController.completions.outsidePressed = true
		fadeInView(view: outsideLeakTitle)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.fadeInView(view: self.outsideImage)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.waterImage)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.yesImage)
					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
						self.fadeInView(view: self.noImage)
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
