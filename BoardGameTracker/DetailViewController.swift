//
//  DetailViewController.swift
//  BoardGameTracker
//
//  Created by Zoran Lazic on 08/12/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var boardGameNameLabel: UILabel!
    
    @IBOutlet weak var rentedToTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var boardGame: BoardGame!
    
    //var imageDetail = ""
    //var nameDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rentedToTextField.delegate = self
        
        boardGameNameLabel.text = boardGame!.name
        navigationItem.title = boardGameNameLabel.text
        
        if let image = boardGame.image {
            self.detailImageView.image = image
        } else {
            self.detailImageView.image = UIImage(named: "blank")
        }
        
        if let rented = boardGame.rented {
            rentedToTextField.text = rented
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
        //navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func returned(sender: UIButton) {
        rentedToTextField.text = ""
        performSegueWithIdentifier("saveandgoback", sender: saveButton)
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            self.boardGame.rented = nil
            if rentedToTextField.text?.isEmpty != true {
                self.boardGame.rented = rentedToTextField.text
            }
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
    }
    
}
