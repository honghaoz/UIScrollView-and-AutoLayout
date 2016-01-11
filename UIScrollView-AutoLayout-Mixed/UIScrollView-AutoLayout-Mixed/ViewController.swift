//
//  ViewController.swift
//  UIScrollView-AutoLayout-Mixed
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
		let views = [
			"scrollView": scrollView
		]
		
		var constraints = [NSLayoutConstraint]()
		
		constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: [], metrics: nil, views: views)
		constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: [], metrics: nil, views: views)
		
		NSLayoutConstraint.activateConstraints(constraints)
		
		// Setup content size
		let contentSize = CGSize(width: screenBounds.width * 2, height: screenBounds.height * 2)
		let contentView = UIView(frame: CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height))
		scrollView.addSubview(contentView)
		
		// Setup some subviews
		// Note: subviews can be added on contentView or scrollView
		// Note: subviews can use frame or Auto Layout. This example uses frame code.
		let v1 = newLabelWithFrame(CGRect(x: 50, y: 100, width: 240, height: 50), text: "v1")
		scrollView.addSubview(v1)
		
		let v2 = newLabelWithFrame(CGRect(x: v1.frame.origin.x + v1.frame.width, y: v1.frame.origin.y + v1.frame.height + 40, width: 240, height: 80), text: "v2")
		scrollView.addSubview(v2)
		
		let v3 = newLabelWithFrame(CGRect(x: 550, y: 100, width: 240, height: 50), text: "v3")
		scrollView.addSubview(v3)
		
		let v4 = newLabelWithFrame(CGRect(x: 50, y: 600, width: 240, height: 50), text: "v4")
		scrollView.addSubview(v4)
		
		// Without this line, scroll view is unscrollable
		scrollView.contentSize = contentView.bounds.size
		
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
	
	private func newLabelWithFrame(frame: CGRect, text: String) -> UILabel {
		let label = UILabel(frame: frame)
		label.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
		label.text = text + ": (\(frame.origin.x), \(frame.origin.y), \(frame.width), \(frame.height))"
		label.textColor = UIColor.whiteColor()
		label.textAlignment = .Center
		
		return label
	}
}

