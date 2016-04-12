//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Sophie Cooper on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageUsername: UILabel?;
    @IBOutlet var imageLikes: UILabel?;
    @IBOutlet var likeButton: UIButton?;
    
    var selectedPhoto: Array<String>!
    
    func likePressed() {
        if (likeButton!.titleLabel!.text! == "Like") {
            imageLikes!.text = String(Int(imageLikes!.text!)!+1);
            likeButton!.setTitle("Unlike", forState: UIControlState.Normal)
            
        } else {
            imageLikes!.text = String(Int(imageLikes!.text!)!-1);
            likeButton!.setTitle("Like", forState: UIControlState.Normal)
        }
    }
    
    override func viewDidLoad() {
        likeButton!.setTitle("Like", forState: UIControlState.Normal)
        let url = NSURL(string: selectedPhoto[0]);
        let photoData = NSData(contentsOfURL: url!);
        imageView.image = UIImage(data: photoData!);
        
        imageUsername!.text = selectedPhoto[1];
        imageLikes!.text = selectedPhoto[2];
        
        likeButton!.addTarget(self, action: "likePressed", forControlEvents: .TouchUpInside)
    }
    
}