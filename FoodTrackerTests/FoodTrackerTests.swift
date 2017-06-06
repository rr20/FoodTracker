//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Rohit Rajan on 26/05/17.
//  Copyright © 2017 Rohit Rajan. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
	

//MARK: Meal Class Tests
	
	func testMealInitializationSuccessds()
	{
	 let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
		
		XCTAssertNotNil(zeroRatingMeal)
		
	let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
		
		XCTAssertNotNil(positiveRatingMeal)
	}
	
	func testMealInitializationFails ()
	{
		let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
		
		XCTAssertNil(negativeRatingMeal)
		
		let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
		XCTAssertNil(largeRatingMeal)
		
		let emptyStringMeal = Meal.init(name: "", photo: nil, rating:0)
		XCTAssertNil(emptyStringMeal)
	}
}
