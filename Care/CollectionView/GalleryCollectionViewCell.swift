//
//  GalleryCollectionViewCell.swift
//  Care
//
//  Created by Alexander Suprun on 17.06.2023.
//


import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let mainImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override  init (frame : CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
          
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor ).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.9
        layer.shadowOffset  = CGSize(width: 5, height: 8)
        
        self.clipsToBounds = false
        
    }
    
    
    required init?(coder aDecoder : NSCoder){
        fatalError("init(coder: ) has not been implemented")
    }
}

 
