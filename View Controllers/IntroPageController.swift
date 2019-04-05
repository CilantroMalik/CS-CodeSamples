//
//  IntroPageController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 10/31/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit
import Firebase

class IntroPageController: UIViewController {
	
	@IBOutlet weak var introTitleLabelView: UIView!
	
	@IBOutlet weak var introSubtitleLabelView: UIView!
	
	@IBOutlet weak var introDescOneView: UIView!
	
	@IBOutlet weak var introDescTwoView: UIView!
	
	@IBOutlet weak var introTitleLabel: UILabel!
	
	@IBOutlet weak var introSubtitleLabel: UILabel!
	
	@IBOutlet weak var introDescOne: UILabel!
	
	@IBOutlet weak var introDescTwo: UILabel!
    
    @IBOutlet weak var nextButtonImageView: UIImageView!
    
    
    @IBOutlet weak var nextButtonImageViewView: UIView!
    
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
		
		
        nextButtonImageView.image = UIImage(named: "30")
        nextButtonImageView.animationImages = nextButtonImageList
        nextButtonImageView.startAnimating()
        
        
		
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
        
		introTitleLabelView.alpha = 0
		introSubtitleLabelView.alpha = 0
		introDescOneView.alpha = 0
		introDescTwoView.alpha = 0
        nextButtonImageViewView.alpha = 0
		fadeInView(view: introTitleLabelView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.fadeInView(view: self.introSubtitleLabelView)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.fadeInView(view: self.introDescOneView)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.fadeInView(view: self.introDescTwoView)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        
                        self.fadeInView(view: self.nextButtonImageViewView)
                        self.nextButtonImageView.animationRepeatCount = 1
                            self.nextButtonImageView.animationDuration = 2
                       
                        self.animateImages()
                        
                    
                    }
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            self.performSegue(withIdentifier: "1", sender: nil)
        }
        
		let dbRootRef1 = Database.database().reference()
		let numberOfUsers = 10
        for i in 1...numberOfUsers {
            let iString = "\(i)"
            let iStringRef1 = dbRootRef1.child(iString)
            let iStringRef2 = iStringRef1.child("sq1")
            if iStringRef2.key == "nil" {
                //put if statement for yes/no buttons: if user pressed yes button set answerForQuestion1 to "yes" but if they pressed no button set it to "no"
                //answerForQuestion1:Any = either yes or no
                //dbRootRef1.child("\(i)/sq1").setValue(answerForQuestion1)
            }
            
        }
        
		
        
        
        /* examples of database protocols
		var sq1Answer1:Any = "yes"
         
		var sq2Answer1:Any = "no"
		
		var sq1Ans1:Any = "yes"
		
		var sq2Ans1:Any = "no"
		
		dbRootRef1.child("Users/Rohan/sq1").setValue(sq1Answer1)
		dbRootRef1.child("Users/Rohan/sq2").setValue(sq2Answer1)
		dbRootRef1.child("Users/Vivek/sq1").setValue(sq1Ans1)
		dbRootRef1.child("Users/Vivek/sq2").setValue(sq2Ans1)
        // Do any additional setup after loading the view.
        */
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
