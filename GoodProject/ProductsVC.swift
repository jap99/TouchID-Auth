//
//  ProductsVC.swift
//  GoodProject
//
//  Created by Javid Poornasir on 9/28/16.
//  Copyright © 2016 Javid Poornasir. All rights reserved.
//


import UIKit
import Alamofire

class ProductsVC: UIViewController {
//UIScrollViewDelegate {
   

    var searchURL = "http://54.191.35.66:8181/pfchang/api/buy?username=Michael&grandTotal=0"
   
    @IBOutlet weak var cartLbl: UILabel!
    
    var cartQty = 0
    
    
    
   /* var imageArray = [UIImage]()
    
   var imageviewsArray = [UIImageView]() // array of imageviews in scrollview
        
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet {
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 1.0
        }
    }
 
 */
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.callAlamo(url: self.searchURL)
}
    @IBAction func addToCartBtnPressed(_ sender: AnyObject) {
        cartQty = cartQty + 1
        cartLbl.text = "\(cartQty)"
        
    }
    
    
    
    
    /*
         NotificationCenter.default.addObserver(self, selector: "rotated", name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        scrollView.delegate = self
 
        
        imageArray = [#imageLiteral(resourceName: "ios7-baseball-outline"), #imageLiteral(resourceName: "ios7-football-outline"), #imageLiteral(resourceName: "ios7-basketball-outline"), #imageLiteral(resourceName: "ios7-americanfootball-outline")]
        
                scrollView.frame = view.frame
                for i in 0..<imageArray.count{
                    let imageView = UIImageView()
                    imageView.image = imageArray[i]
                    imageView.contentMode = .scaleAspectFit
                    let xPosition = self.view.frame.width * CGFloat(i)
                    imageView.frame = CGRect(x: xPosition, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height/1.2)
                    
                    scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
                    scrollView.addSubview(imageView)
            
                    imageviewsArray.append(imageView) // Add imageview to array

        }}
    
    // Function calls when device rotated
    func rotated() {
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            print("landscape")
            imageviewsArray = []
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            print("Portrait")
            imageviewsArray = []
        }
        
        // go through all imageviews and setup new frame
        for i in 0..<imageviewsArray.count{
            var imageView = imageviewsArray[i]
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height/1.2)
            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
        }
    }

   */
    func callAlamo(url: String) {
        Alamofire.request(url, method: .post).responseJSON(completionHandler: {
            response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        })
    }

  
 
 
}
