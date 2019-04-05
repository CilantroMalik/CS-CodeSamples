//
//  EndViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 12/21/17.
//  Copyright © 2017 RAJEEV MALIK. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
	
	@IBAction func backButtonPressed(_ sender: UIButton) {
		HubViewController.foundLeaks.toiletLeak = false
		HubViewController.foundLeaks.bathtubLeak = false
		HubViewController.foundLeaks.kitchenLeak = false
		HubViewController.foundLeaks.basementLeak = false
		HubViewController.foundLeaks.outsideLeak = false
		HubViewController.completions.toiletPressed = false
		HubViewController.completions.bathtubPressed = false
		HubViewController.completions.kitchenPressed = false
		HubViewController.completions.basementPressed = false
		HubViewController.completions.outsidePressed = false
		HubViewController.completions.lastStepPressed = false
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

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
