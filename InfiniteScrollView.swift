//
//  InfiniteScrollView.swift
//  GoodProject
//
//  Created by Javid Poornasir on 9/29/16.
//  Copyright © 2016 Javid Poornasir. All rights reserved.
//

import UIKit

class InfiniteScrollView: UIScrollView {
    
    let cellWidth: CGFloat = 150.0
        //self.view.frame.width
    //150.0
    let groupWidth: CGFloat = 150.0 * 7

    var imageArray: [UIImage] = [#imageLiteral(resourceName: "ios7-baseball-outline"), #imageLiteral(resourceName: "ios7-football-outline"), #imageLiteral(resourceName: "ios7-basketball-outline"), #imageLiteral(resourceName: "ios7-americanfootball-outline")]
    
    var imageviewsArray = [UIImageView]()

    var containerView: UIView!
    
    var firstCall: Bool = true
    var page: Int = 0
    var myContentOffset: CGPoint = CGPoint.zero
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.contentSize = CGSize(width: groupWidth * 5, height: 768)
        self.containerView = UIView(frame: CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height))
        self.addSubview(self.containerView)
    }
    
    init() {
    for i in 0..<imageArray.count{
        
        let imgView = UIImageView()
        imgView.image = imageArray[i]
        imgView.frame = CGRect(x: CGFloat(i) * cellWidth, y: 0, width: cellWidth, height: 25)
        self.containerView.addSubview(imgView)
        self.imageviewsArray.append(imgView)
    
    }
        self.showsHorizontalScrollIndicator = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.recenterIfNecessary()
    }
    
    func recenterIfNecessary() {
        let currentOffset: CGPoint = self.contentOffset
        let centerOffsetX: CGFloat = 2 * groupWidth
        
        let directionScroll: CGFloat = currentOffset.x - centerOffsetX
        let distanceFromCenter: CGFloat = fabs(directionScroll)
        
        if(distanceFromCenter > 0) {
            self.page = page + 1
        } else {
            self.page = page - 1
        }
    }
    
   
    if self.firstCall {
    self.firstCall = false
    self.page = 0
    self.myContentOffset = CGPoint.zero
    }
    self.updateImageArray()

    
        self.myContentOffset = CGPoint((x: groupWidth * (CGFloat)(self.page)) + directionScroll, y: currentOffset.y)
        print("\(self.page) : \(self.myContentOffset.x)")
    }


    func updateImageArray() {
        for i in 0..<imageArray.count {
            let imageView = UIImageView()
            imageView.image = imageviewsArray[i]
            
            imageView.contentMode = .scaleAspectFit
        

        }}
    
    

    
    /*
    
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

    */


