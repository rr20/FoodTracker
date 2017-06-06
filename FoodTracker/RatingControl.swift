//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Rohit Rajan on 27/05/17.
//  Copyright © 2017 Rohit Rajan. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
	
	//MARK: Properties 
	private var ratingButtons = [UIButton]()
	
	var rating = 0 {
		didSet{
			updateButtonSelectionStates()
		}
	}
	
	@IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
	{
		didSet{
			setupButtons()
		}
		
	}
	@IBInspectable	var starCount: Int = 5
		{
		didSet{
			setupButtons()
		}
	}
	
	//MARK: Initialization
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupButtons()
	}
	
	required init(coder: NSCoder)
	
	{
		super.init(coder: coder)
		setupButtons()
		
	}
	
	//MARK: Button Action
	func ratingButtonTapped(button: UIButton) {
		
		guard let index = ratingButtons.index(of: button) else {
			fatalError("The Button, \(button) is not in the ratingButtons Array: \(ratingButtons)")
		}
		
		print("Button Pressed ")
		let selectedRating = index + 1
		
		if selectedRating == rating {
			rating = 0

		} else {
			rating = selectedRating
		}
	}
	
	//MARK: Private Methods
	
	private func setupButtons ()
	{
		
		for button in ratingButtons
		{
			removeArrangedSubview(button)
			
			button.removeFromSuperview()
		}
		
		ratingButtons.removeAll()
		
		let bundle = Bundle(for: type(of: self))
		let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
		let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
		let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)

		
		
		
		for index in 0..<starCount {
		
			let button = UIButton ()
		
			button.setImage(emptyStar, for: .normal)
			button.setImage(filledStar, for: .selected)
			button.setImage(highlightedStar, for: .highlighted)
			button.setImage(highlightedStar, for: [.highlighted, .selected])


		
			button.translatesAutoresizingMaskIntoConstraints = true
			button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
			button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
			
			button.accessibilityLabel = "Set \(index + 1) star rating"
			
			button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
			
			addArrangedSubview(button)
			ratingButtons.append(button)
			
			}
		
	updateButtonSelectionStates()
		
		}

	private func updateButtonSelectionStates ()
	{
		for (index, button) in ratingButtons.enumerated()
		{
			button.isSelected = index < rating
		}
		
		
	}
	
  }
