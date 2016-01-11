//
//  ViewController.swift
//  UIScrollView-AutoLayout-Pure-Programmatically
//
//  Created by Honghao Zhang on 2015-09-10.
//  Copyright (c) 2015 Honghao Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let scrollView = UIScrollView()
	var screenBounds: CGRect { return UIScreen.mainScreen().bounds }
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Setup scroll view
		
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.backgroundColor = UIColor(red:20/255.0, green:119/255.0, blue:61/255.0, alpha:255/255.0)
		view.addSubview(scrollView)
		
		// Setup constraints
		var views: [String: UIView] = [
			"scrollView": scrollView
		]
		
		var constraints = [NSLayoutConstraint]()
		
		// External constraints
		constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: [], metrics: nil, views: views)
		constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: [], metrics: nil, views: views)
		
		
		// Internal constraints
		// Note: to let scrollView determines its contentSize, four edges should be explicitly specified
		let v1 = newLabelWithText("v1 v1 v1 v1 v1 v1 v1 v1 v1 v1")
		scrollView.addSubview(v1)
		views["v1"] = v1
		
		let v2 = newLabelWithText("v2 v2 v2 v2 v2")
		scrollView.addSubview(v2)
		views["v2"] = v2
		
		let v3 = newLabelWithText("v3 v3 v3 v3 v3")
		scrollView.addSubview(v3)
		views["v3"] = v3
		
		// Horizontal, fully specified
		constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-100-[v1]-200-[v2]-150-|", options: .AlignAllBaseline, metrics: nil, views: views)
		// Verticaly, fully specified
		constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[v1]-400-[v3]-250-|", options: .AlignAllLeading, metrics: nil, views: views)
		
		NSLayoutConstraint.activateConstraints(constraints)
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
	
	private func newLabelWithText(text: String) -> UILabel {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
		label.font = UIFont.boldSystemFontOfSize(36)
		label.text = text
		label.textColor = UIColor.whiteColor()
		label.textAlignment = .Center
		
		return label
	}
}
