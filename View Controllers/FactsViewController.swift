//
//  FactsViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 11/4/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    @IBOutlet weak var factsTitleLabelView: UIView!
    
    @IBOutlet weak var factsDesc1View: UIView!
    
    @IBOutlet weak var factsDesc2View: UIView!
    
	
	@IBOutlet weak var factsDesc2IV2: UIImageView!
	
	@IBOutlet weak var nextButtonImageViewView1: UIView!
    
    @IBOutlet weak var nextButtonImageView1: UIImageView!
	
    func fadeInView(view: UIView) {
        let animationDuration = 0.5
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in view.alpha = 1})
    }
	
	func fadeOutImageView(imageView: UIImageView) {
		let animationDuration = 0.5
		UIImageView.animate(withDuration: animationDuration, animations: { () -> Void in imageView.alpha = 0})
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
        
        nextButtonImageView1.image = UIImage(named: "30")
        nextButtonImageView1.animationImages = nextButtonImageList
        nextButtonImageView1.startAnimating()
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        factsTitleLabelView.alpha = 0
        factsDesc1View.alpha = 0
        factsDesc2View.alpha = 0
        nextButtonImageViewView1.alpha = 0
        fadeInView(view: factsTitleLabelView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.fadeInView(view: self.factsDesc1View)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.fadeInView(view: self.factsDesc2View)
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
					self.fadeInImageView(imageView: self.factsDesc2IV2)
					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
						self.fadeInView(view: self.nextButtonImageViewView1)
						self.nextButtonImageView1.animationRepeatCount = 1
						self.nextButtonImageView1.animationDuration = 2
						
						self.animateImages()
						
					}
				}
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            self.performSegue(withIdentifier: "2", sender: nil)
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
