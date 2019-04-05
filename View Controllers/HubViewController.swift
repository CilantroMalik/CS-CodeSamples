//
//  HubViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/21/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit
import Firebase


class HubViewController: UIViewController {
	
    //---------completions--------//
    
	@IBOutlet weak var toiletCompletion: UIImageView!
	
	@IBOutlet weak var bathtubCompletion: UIImageView!
	
	@IBOutlet weak var kitchenCompletion: UIImageView!
	
	@IBOutlet weak var basementCompletion: UIImageView!
	
	@IBOutlet weak var outsideCompletion: UIImageView!
	
	@IBOutlet weak var lastStepCompletion: UIImageView!
    
    //------Icon Image Views------//
    
    @IBOutlet weak var toiletIcon: UIImageView!
    
    @IBOutlet weak var kitchenIcon: UIImageView!
    
    @IBOutlet weak var outsideIcon: UIImageView!
    
    @IBOutlet weak var bathtubIcon: UIImageView!
    
    @IBOutlet weak var washerDryerIcon: UIImageView!
    
    @IBOutlet weak var lastStepIcon: UIImageView!
    
    
    //--------Icon Labels--------//
    
    @IBOutlet weak var toiletLabel: UILabel!
    
    @IBOutlet weak var kitchenLabel: UILabel!
    
    @IBOutlet weak var outsideLabel: UILabel!
    
    @IBOutlet weak var bathtubLabel: UILabel!
    
    @IBOutlet weak var washerDryerLabel: UILabel!
    
    @IBOutlet weak var lastStepLabel: UILabel!
    
	@IBOutlet weak var doThisFirstImage: UIImageView!
	
	@IBOutlet weak var andThisLast: UIImageView!
	
	
	struct completions {
		static var toiletPressed = false
		static var bathtubPressed = false
		static var kitchenPressed = false
		static var basementPressed = false
		static var outsidePressed = false
		static var lastStepPressed = false
	}
	struct repeats {
		static var toiletRepeat = 0
		static var bathtubRepeat = 0
		static var kitchenRepeat = 0
		static var basementRepeat = 0
		static var outsideRepeat = 0
		static var lastStepRepeat = 0
		static var introRepeat = 0
	}
	
	struct foundLeaks {
		static var bathtubLeak = false
		static var kitchenLeak = false
		static var basementLeak = false
		static var outsideLeak = false
		static var toiletLeak = false
	}
	
	func fadeInView(view: UIView) {
		let animationDuration = 0.5
		UIView.animate(withDuration: animationDuration, animations: { () -> Void in view.alpha = 1})
	}
	
	@IBOutlet weak var replayIntroButton: UIButton!
	
	@IBAction func replayIntroPressed(_ sender: UIButton) {
	}
	
	@IBOutlet weak var finishLeakCheck: UIButton!
	
	@IBAction func didPressComplete(_ sender: UIButton) {
	}
	
	
	
	func animateImages(imageView: UIImageView) {
		var nextButtonImageList:[UIImage] = []
		for i in 93...123
		{
			
			let imageName:String = "\(i)"
			let img = UIImage(named: imageName)
			nextButtonImageList.append(img!)
			
		}
		imageView.image = UIImage(named: "123")
		imageView.animationImages = nextButtonImageList
		imageView.animationDuration = 2
	}
	
	@IBAction func didPressToilet(_ sender: UIButton) {
	}
	
	@IBAction func didPressBathtub(_ sender: UIButton) {
	}
	
	@IBAction func didPressKitchen(_ sender: UIButton) {
	}
	
	@IBAction func didPressBasement(_ sender: UIButton) {
	}
	
	@IBAction func didPressOutside(_ sender: UIButton) {
	}
	
	@IBAction func didPressLastStep(_ sender: UIButton) {
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		finishLeakCheck.isHidden = true
		if HubViewController.completions.toiletPressed == true {
            toiletIcon.isHidden = true
			
			doThisFirstImage.isHidden = true
			toiletCompletion.isHidden = false
			if repeats.toiletRepeat == 0 {
				animateImages(imageView: toiletCompletion)
				toiletCompletion.startAnimating()
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					self.toiletCompletion.stopAnimating()
				}
			}
			else {
				toiletCompletion.image = UIImage(named: "123")
			}
			repeats.toiletRepeat = 1
		}
		if HubViewController.completions.bathtubPressed == true {
            bathtubIcon.isHidden = true
			bathtubCompletion.isHidden = false
			if repeats.bathtubRepeat == 0 {
				animateImages(imageView: bathtubCompletion)
				bathtubCompletion.startAnimating()
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					self.bathtubCompletion.stopAnimating()
				}
			}
			else {
				bathtubCompletion.image = UIImage(named: "123")
			}
			repeats.bathtubRepeat = 1
		}
		if HubViewController.completions.kitchenPressed == true {
            kitchenIcon.isHidden = true
			kitchenCompletion.isHidden = false
			if repeats.kitchenRepeat == 0 {
				animateImages(imageView: kitchenCompletion)
				kitchenCompletion.startAnimating()
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					self.kitchenCompletion.stopAnimating()
				}
			}
			else {
				kitchenCompletion.image = UIImage(named: "123")
			}
			repeats.kitchenRepeat = 1
		}
		if HubViewController.completions.basementPressed == true {
            washerDryerIcon.isHidden = true
			basementCompletion.isHidden = false
			if repeats.basementRepeat == 0 {
				animateImages(imageView: basementCompletion)
				basementCompletion.startAnimating()
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					self.basementCompletion.stopAnimating()
				}
			}
			else {
				basementCompletion.image = UIImage(named: "123")
			}
			repeats.basementRepeat = 1
		}
		if HubViewController.completions.outsidePressed == true {
            outsideIcon.isHidden = true
			outsideCompletion.isHidden = false
			if repeats.outsideRepeat == 0 {
				animateImages(imageView: outsideCompletion)
				outsideCompletion.startAnimating()
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					self.outsideCompletion.stopAnimating()
				}
			}
			else {
				outsideCompletion.image = UIImage(named: "123")
			}
			repeats.outsideRepeat = 1
		}
		if HubViewController.completions.lastStepPressed == true {
            lastStepIcon.isHidden = true
			lastStepCompletion.isHidden = false
			if repeats.lastStepRepeat == 0 {
				animateImages(imageView: lastStepCompletion)
				lastStepCompletion.startAnimating()
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					self.lastStepCompletion.stopAnimating()
				}
			}
			else {
				lastStepCompletion.image = UIImage(named: "123")
			}
			repeats.lastStepRepeat = 1
		}
		
		if completions.toiletPressed == true && completions.bathtubPressed == true && completions.kitchenPressed == true && completions.basementPressed == true && completions.outsidePressed == true && completions.lastStepPressed == true  {
			let ref = Database.database().reference().child("Users")
			let userRef = ref.childByAutoId()
			let toiletLeakRef = userRef.childByAutoId()
			if foundLeaks.toiletLeak == true {
				let toiletValue1:Any = "toilet-yes"
				toiletLeakRef.setValue(toiletValue1)
			}
			else {
				let toiletValue2:Any = "toilet-no"
				toiletLeakRef.setValue(toiletValue2)
			}
			
			let showerLeakRef = userRef.childByAutoId()
			if foundLeaks.bathtubLeak == true {
				let showerValue1:Any = "shower-yes"
				showerLeakRef.setValue(showerValue1)
			}
			else {
				let showerValue2:Any = "shower-no"
				showerLeakRef.setValue(showerValue2)
			}
			
			let kitchenLeakRef = userRef.childByAutoId()
			if foundLeaks.kitchenLeak == true {
				let kitchenValue1:Any = "kitchen-yes"
				kitchenLeakRef.setValue(kitchenValue1)
			}
			else {
				let kitchenValue2:Any = "kitchen-no"
				kitchenLeakRef.setValue(kitchenValue2)
			}
			
			let washerLeakRef = userRef.childByAutoId()
			if foundLeaks.basementLeak == true {
				let washerValue1:Any = "washer-yes"
				washerLeakRef.setValue(washerValue1)
			}
			else {
				let washerValue2:Any = "washer-no"
				washerLeakRef.setValue(washerValue2)
			}
			
			let outsideLeakRef = userRef.childByAutoId()
			if foundLeaks.outsideLeak == true {
				let outsideValue1:Any = "outside-yes"
				outsideLeakRef.setValue(outsideValue1)
			}
			else {
				let outsideValue2:Any = "outside-no"
				outsideLeakRef.setValue(outsideValue2)
			}
			andThisLast.isHidden = true
			finishLeakCheck.isHidden = false
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

