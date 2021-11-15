//
//  CreateViewController.swift
//  Spice
//
//  Created by Laura Chang on 11/14/21.
//

import UIKit
import AlamofireImage
import Parse

class CreateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var ingredientsText: UITextView!
    @IBOutlet weak var instructionsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmitButton(_ sender: Any) {
        // create pf object
        let recipe = PFObject(className: "Recipes")
        
        recipe["title"] = titleField.text!
        //recipe["ingredients"] = ingredientsText PFObject may not have type text view
        //recipe["instructions"] = instructionsText
        recipe["author"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData() // imageView.image is reduced image saved from camera (see in imagePickerController(), now saved as png
        let file = PFFileObject(name: "image.png", data: imageData!) // binary object, able to be stored in Parse
        
        recipe["image"] = file // will have url for file (which is stored in separate table)
        
        recipe.saveInBackground { success, error in
            if (success) {
                print("saved recipe")
                //self.dismiss(animated: true, completion: nil) // dismisses back to login screen
                self.performSegue(withIdentifier: "feedSegue", sender: nil)
            } else {
                print("error while saving recipe")
            }
        }
    }
    
    @IBAction func onAddButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self // returns what user picks
        picker.allowsEditing = true;
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) { // if camera is available (.camera is enum)
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
