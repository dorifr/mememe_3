//
//  MemeDetailViewController.swift
//  ImagePickerExperiment
//
//  Created by Dori Frost on 5/13/15.
//  Copyright (c) 2015 Dori.Frost. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var memeView: UIImageView!
   
    var meme: Meme!
    var memeIndex: Int!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.memeView.image =  self.meme.memedImage!
        self.tabBarController?.tabBar.hidden = true
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    @IBAction func deleteMeme(sender: AnyObject) {
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.removeAtIndex(memeIndex)
        
        //Using popViewControllerAnimated(true) to get to SentMemesView got me the meme list with the deleted rows still showing.
        //So I resorted to dismissviewController. Less than optimal because it takes me to the root controller.
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    @IBAction func editMeme(sender: UIBarButtonItem) {

        
        var storyboard = UIStoryboard (name: "Main", bundle: nil)
        var editorVC = storyboard.instantiateViewControllerWithIdentifier("EditorView") as! EditorViewController
        editorVC.editedMeme = self.meme
//        editorVC.imagePickerView.image = self.meme.image
//        editorVC.bottomTextField.text = self.meme.bottomText
        self.presentViewController(editorVC, animated: true, completion: nil)
        
        //dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    

    

}
