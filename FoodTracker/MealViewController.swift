//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Rohit Rajan on 26/05/17.
//  Copyright © 2017 Rohit Rajan. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
//MARK: Properties
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var ratingControl: RatingControl!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	var meal: Meal?
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		nameTextField.delegate=self
		
		if let meal = meal {
			
			navigationItem.title = meal.name
			nameTextField.text=meal.name
			photoImageView.image=meal.photo
			ratingControl.rating=meal.rating
		}
		
		updateSaveButtonState()	
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: UITextFieldDelegate
	func textFieldShouldReturn(_ textField: UITextField) -> Bool
	{
		textField.resignFirstResponder()
		return true
	}
	func textFieldDidEndEditing(_ textField: UITextField) {
		
		updateSaveButtonState()
		navigationItem.title = textField.text
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		
		saveButton.isEnabled = false

	}
	//MARK: UIImagePickerControlDelegate
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
	{
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
	{
		guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
			fatalError("Expected a dictionary containing an image, But was provided the following: \(info)")
			
			}
		photoImageView.image = selectedImage
		dismiss(animated: true, completion: nil)
	}
	
	//MARK: Navigation
	
	
	@IBAction func cancel(_ sender: UIBarButtonItem) {
		
		let isPresentingInAddMealMode = presentedViewController is UINavigationController
		
		if isPresentingInAddMealMode{
			
			
			dismiss(animated: true, completion: nil)
		}
		else if let owningNavingationController = navigationController {
			owningNavingationController.popViewController(animated: true)
			
		}
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		super.prepare(for: segue, sender: sender)
		
		guard let button = sender as? UIBarButtonItem, button === saveButton else {
			os_log("The Save button was not pressed, cancelling", log: OSLog.default,type: .debug)
			
			return
		}
		
		let name = nameTextField.text ?? ""
		let photo = photoImageView.image
		let rating = ratingControl.rating
		
		
		meal = Meal(name: name, photo: photo, rating: rating)
		
	}
	
	//MARK:Actions
	@IBAction func selectImagefromPhotoLibrary(_ sender: UITapGestureRecognizer) {
		
		nameTextField.resignFirstResponder()
		
		let imagePickerController = UIImagePickerController()
		
		imagePickerController.sourceType = .photoLibrary
		
		imagePickerController.delegate=self
		
		present(imagePickerController, animated: true, completion: nil)
	}
	
	//MARK: Private Methods
	
	private func updateSaveButtonState ()
	
	{
		
		let text = nameTextField.text ?? ""
		
		saveButton.isEnabled = !text.isEmpty
	}

}

