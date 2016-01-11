//
//  ViewController.swift
//  UIScrollView-Frame
//
//  Created by Honghao Zhang on 2015-09-10.
//  Copyright (c) 2015 Honghao Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var screenBounds: CGRect { return UIScreen.mainScreen().bounds }
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Setup scroll view
		let scrollView = UIScrollView(frame: screenBounds)
		scrollView.backgroundColor = UIColor(red:20/255.0, green:119/255.0, blue:61/255.0, alpha:255/255.0)
		view.addSubview(scrollView)
		
		// Setup scroll view content size
		// Larger
		scrollView.contentSize = CGSize(width: screenBounds.width * 2, height: screenBounds.height * 2)
		
		// Exact
//		scrollView.contentSize = screenBounds.size
		
		// Smaller
//		scrollView.contentSize = CGSize(width: screenBounds.width / 2.0, height: screenBounds.height / 2.0)
		
		// Setup some subviews
		let v1 = newLabelWithFrame(CGRect(x: 50, y: 100, width: 240, height: 50), text: "v1")
		scrollView.addSubview(v1)
		
		let v2 = newLabelWithFrame(CGRect(x: v1.frame.origin.x + v1.frame.width, y: v1.frame.origin.y + v1.frame.height + 40, width: 240, height: 80), text: "v2")
		scrollView.addSubview(v2)
		
		let v3 = newLabelWithFrame(CGRect(x: 550, y: 100, width: 240, height: 50), text: "v3")
		scrollView.addSubview(v3)
		
		let v4 = newLabelWithFrame(CGRect(x: 50, y: 600, width: 240, height: 50), text: "v4")
		scrollView.addSubview(v4)
	}
	
	private func newLabelWithFrame(frame: CGRect, text: String) -> UILabel {
		let label = UILabel(frame: frame)
		label.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
		label.text = text + ": (\(frame.origin.x), \(frame.origin.y), \(frame.width), \(frame.height))"
		label.textColor = UIColor.whiteColor()
		label.textAlignment = .Center
		
		return label
	}
}

