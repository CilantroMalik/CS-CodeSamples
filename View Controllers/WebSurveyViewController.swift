//
//  WebSurveyViewController.swift
//  FirebaseTest
//
//  Created by Rohan MALIK on 1/3/18.
//  Copyright © 2018 RAJEEV MALIK. All rights reserved.
//

import UIKit
import WebKit

class WebSurveyViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear( animated )
		let url:URL = URL(string: "https://goo.gl/forms/Wl1Q3sHY6FudBSWu1")!
		let urlRequest:URLRequest = URLRequest(url: url)
		webView.load(urlRequest)
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
