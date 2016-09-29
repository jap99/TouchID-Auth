//
//  ProductsVC.swift
//  GoodProject
//
//  Created by Javid Poornasir on 9/28/16.
//  Copyright © 2016 Javid Poornasir. All rights reserved.
//











import UIKit
import Alamofire

class ProductsVC: UIViewController, UIScrollViewDelegate {
   
    
    var searchURL = "http://54.191.35.66:8181/pfchang/api/buy?username=Michael&grandTotal=0"
    //var scrollViewHeight: CGFloat!
    //var scrollViewWidth: CGFloat!
    //let numPics: Int = 4
    
   var imageArray = [UIImage]()
        
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet {
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.delegate = self
        self.callAlamo(url: self.searchURL)
        
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
            


        }}
    
   
    func callAlamo(url: String) {
        Alamofire.request(url, method: .post).responseJSON(completionHandler: {
            response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        })
    }

  
    
    /*
 
 self.scrollView.frame = CGRect(0, 0, self.view.frame.width, self.view.frame.height)
 scrollViewHeight = self.scrollView.frame.height
 scrollViewWidth = self.scrollView.frame.width
 
 let img1 = UIImageView()
 let img2 = UIImageView()
 let img3 = UIImageView()
 let img4 = UIImageView()
 
 var arrPics = [img1, img2, img3, img4]
 var arrSlide = [#imageLiteral(resourceName: "ios7-baseball"), #imageLiteral(resourceName: "ios7-football"), #imageLiteral(resourceName: "ios7-basketball"), #imageLiteral(resourceName: "ios7-home")]
 
 for i in 0..<arrPics.count {
 
 arrPics[i] = UIImageView(frame: CGRect(0, scrollViewHeight * CGFloat(i), scrollViewWidth, scrollViewHeight))
 
 arrPics[i].image = UIImage(named: arrSlide[i])
 self.scrollView.addSubview(arrPics[i])
 }
 
 self.scrollView.contentSize = CGSize(self.scrollView.frame.width, self.scrollView.frame.height * CGFloat(numPics+1))
 
     
     
     
     
     for x in 0...5 {
     let img = UIImage(named: "\(x)")
     let imgView = UIImageView(image: img)
     
     scrollView.addSubview(imgView)
     
     // We are adding each img to the right hand side of each other
     // We're multiplying each position by its width
     imgView.frame = CGRect(x: -WIDTH + (WIDTH * CGFloat(x)), y: 0, width: WIDTH, height: HEIGHT)
     
     // When we're done adding items to the scroll view we need to add the content size
     // We have to set the size so it knows how far to scroll
     scrollView.contentSize = CGSize(width: WIDTH * 5, height: scrollView.frame.size.height)
     }
     

     
     
     // Making a proportional width, and height :
     let widthConstraint = NSLayoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0)
     self.view.addConstraint(widthConstraint)
     let heightConstraint = NSLayoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0)
     self.view.addConstraint(heightConstraint)
     
     // Center align X and center align Y:
     let alignCenterYConstraint = NSLayoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 2.0, constant: 0)
     self.view.addConstraint(alignCenterYConstraint)
     let alignCenterXConstraint = NSLayoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
     self.view.addConstraint(alignCenterXConstraint)
     }
     scrollView.contentSize.width = scrollView.frame.width * CGFloat(imageArray.count)


 */
 
 
    
    
    
    
    
    
 
 
 
 
 
 
}
