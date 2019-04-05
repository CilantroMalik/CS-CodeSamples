//
//  ShowerLeakViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 12/5/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit
import Firebase



class ShowerLeakViewController: UIViewController {
	
	@IBOutlet weak var showerLeakTitleView: UIView!
	
	@IBOutlet weak var showerImage: UIView!
	
	@IBOutlet weak var waterImage: UIView!
	
	@IBOutlet weak var yesButton: UIButton!
	
	@IBOutlet weak var noButton: UIButton!
	
	@IBOutlet weak var yesView: UIView!
	
	@IBOutlet weak var noView: UIView!
	
	@IBAction func yesButtonPressed(_ sender: UIButton) {
		HubViewController.foundLeaks.bathtubLeak = true
	}
	
	@IBAction func noButtonPressed(_ sender: UIButton) {
		HubViewController.foundLeaks.bathtubLeak = false
	}
	func fadeInView(view: UIView) {
		let animationDuration = 0.5
		UIView.animate(withDuration: animationDuration, animations: { () -> Void in view.alpha = 1})
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		HubViewController.completions.bathtubPressed = true
		fadeInView(view: showerLeakTitleView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.fadeInView(view: self.showerImage)
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.fadeInView(view: self.waterImage)
				DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
					self.fadeInView(view: self.yesView)
					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
						self.fadeInView(view: self.noView)
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
