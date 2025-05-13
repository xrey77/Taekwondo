//
//  TbsCollectionViewCell1.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/12/25.
//

import UIKit

class TbsCollectionViewCell1: UICollectionViewCell {
    
    var tbsImageBatch1 = UIImageView()
    var tbsLabelBatch1 = UILabel()

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /**
    static let identifier = "Cell01"
      
      // Lazy initialization of the UIImageView
      private lazy var imageView: UIImageView = {
          let tbsImageBatch1 = UIImageView()
        tbsImageBatch1.translatesAutoresizingMaskIntoConstraints = false
        tbsImageBatch1.contentMode = .scaleAspectFit
          return tbsImageBatch1
      }()
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          setupView()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      // Configure the cell with the image name
      func configure(with imageName: String) {
          imageView.image = UIImage(systemName: imageName)
      }
      
      // Setup the view and add imageView with constraints
      private func setupView() {
          contentView.addSubview(imageView)
          NSLayoutConstraint.activate([
              imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
              imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
              imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
          ])
      }
    
     */

}
