//
//  ViewController.swift
//  UIScrollView-AutoLayout-Pure-InterfaceBuilder
//
//  Created by Honghao Zhang on 2015-09-10.
//  Copyright (c) 2015 Honghao Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	//
	
	@IBOutlet weak var scrollView: UIScrollView!
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("scrollView.contentSize: \(scrollView.contentSize)")
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		print("scrollView.contentSize: \(scrollView.contentSize)")
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		print("scrollView.contentSize: \(scrollView.contentSize)")
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		print("scrollView.contentSize: \(scrollView.contentSize)")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

