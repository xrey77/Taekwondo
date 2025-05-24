//
//  CTView.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit
import CoreText

class CTView: UIView {
            
//    private let scrollView: UIScrollView = {
//        let sv = UIScrollView()
//        return sv
//    }()
    

    // MARK: - Properties
    var attrString: NSAttributedString!

    // MARK: - Internal
    func importAttrString(_ attrString: NSAttributedString) {
      self.attrString = attrString
    }

    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
//        attrString.
        // Flip the coordinate system
        context.textMatrix = .identity
        context.translateBy(x: 10, y: bounds.size.height + 50)
        context.scaleBy(x: 1.0, y: -1.0)
        

        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle(withAlignment: .justified),
            .font: UIFont(name: "Helvetica", size: 16)!
        ]
        
        let pageHeight : CGFloat = {
            return 11 * 72.0
        }()

        
        let pageWidth : CGFloat  = {
            return 8.5 * 72.0
        }()
        
        let marginPoint : CGPoint = {
            return CGPoint(x: 10, y: 10)
        }()

        let marginSize : CGSize = {
            return CGSize(width: marginPoint.x * 2 , height: marginPoint.y * 2)
        }()
                
        let frameRect = CGRect(x: 10, y: marginPoint.y - 140, width: pageWidth - 280.0, height: pageHeight - marginSize.height + 200.0)
        
//        scrollView.contentSize = CGSize(width: pageWidth - 280.0, height: pageHeight)
        
        let path = CGMutablePath()
        path.addRect(frameRect, transform: .identity)
//        path.addRect(bounds)
        let attrString = NSAttributedString(string: "When it comes to building rich and visually captivating iOS applications, text is an integral part of the user experience. Whether you’re creating a sleek e-reader, a sophisticated text editor, or a beautifully designed magazine app, having precise control over text layout and rendering is paramount. Apple’s Core Text framework is the key to unlocking advanced text handling in iOS, allowing you to create sophisticated text-driven interfaces and deliver polished, professional content to your users. In this comprehensive guide, we will explore the world of Core Text in iOS, covering its essential features, advanced techniques, and real-world examples. By the end of this blog, you’ll have a solid understanding of how to leverage Core Text for text layout and rendering, enabling you to take your iOS app’s user experience to the next level. \n\n In general, \"core text\" refers to the most important or fundamental text within a subject or field of study. It's a text that is considered essential for understanding the core concepts, principles, or themes of that area. In academia, this might mean the primary texts used in a course or the most influential works in a particular discipline.\n\nCentral Themes:\n\n Core texts often serve as the foundation upon which further scholarship and discussion are built. They might represent original ideas, new directions in a field, or the most influential works that have shaped a particular area of study", attributes: attributes)
        let framesetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrString.length), path, nil)
        CTFrameDraw(frame, context)
        
    }

    override class func accessibilityScroll(_ direction: UIAccessibilityScrollDirection) -> Bool {
        return true
    }
    
    func paragraphStyle(withAlignment alignment: CTTextAlignment) -> NSMutableParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        return paragraphStyle
    }
    
    
}
