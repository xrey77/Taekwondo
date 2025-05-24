//
//  MarkupParser.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit
import CoreText

class MarkupParser: NSObject {

    // MARK: - Properties
     var color: UIColor = .black
     var fontName: String = "Arial"
     var attrString: NSMutableAttributedString!
     var images: [[String: Any]] = []

     // MARK: - Initializers
     override init() {
       super.init()
     }
     
     // MARK: - Internal
     func parseMarkup(_ markup: String) {
        //1
        attrString = NSMutableAttributedString(string: "")
        //2
        do {
          let regex = try NSRegularExpression(pattern: "(.*?)(<[^>]+>|\\Z)",
                                              options: [.caseInsensitive,
                                                        .dotMatchesLineSeparators])
          //3
          let chunks = regex.matches(in: markup,
                                     options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                     range: NSRange(location: 0, length: markup.count))
            
            let defaultFont: UIFont = .systemFont(ofSize: UIScreen.main.bounds.size.height / 40)
            //1
            for chunk in chunks {
              //2
              guard let markupRange = markup.range(from: chunk.range) else { continue }
              //3
              let parts = markup[markupRange].components(separatedBy: "<")
              //4
              let font = UIFont(name: fontName, size: UIScreen.main.bounds.size.height / 40) ?? defaultFont
              //5
                let attrs = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font] as [NSAttributedString.Key : Any]
              let text = NSMutableAttributedString(string: parts[0], attributes: attrs)
              attrString.append(text)
                
                
                // 1
                if parts.count <= 1 {
                  continue
                }
                let tag = parts[1]
                //2
                if tag.hasPrefix("font") {
                  let colorRegex = try NSRegularExpression(pattern: "(?<=color=\")\\w+",
                                                           options: NSRegularExpression.Options(rawValue: 0))
                  colorRegex.enumerateMatches(in: tag,
                    options: NSRegularExpression.MatchingOptions(rawValue: 0),
                    range: NSMakeRange(0, tag.count)) { (match, _, _) in
                      //3
                      if let match = match,
                        let range = tag.range(from: match.range) {
                          let colorSel = NSSelectorFromString(tag[range]+"Color")
                          color = UIColor.perform(colorSel).takeRetainedValue() as? UIColor ?? .black
                      }
                  }
                  //5
                  let faceRegex = try NSRegularExpression(pattern: "(?<=face=\")[^\"]+",
                                                          options: NSRegularExpression.Options(rawValue: 0))
                  faceRegex.enumerateMatches(in: tag,
                    options: NSRegularExpression.MatchingOptions(rawValue: 0),
                    range: NSMakeRange(0, tag.count)) { (match, _, _) in

                      if let match = match,
                        let range = tag.range(from: match.range) {
                          fontName = String(tag[range])
                      }
                  }
                } //end of font parsing

                
                
            }

            
            
        } catch _ {
        }

     }
    
    
    
}

// MARK: - String
extension String {
  func range(from range: NSRange) -> Range<String.Index>? {
    guard let from16 = utf16.index(utf16.startIndex,
                                   offsetBy: range.location,
                                   limitedBy: utf16.endIndex),
      let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex),
      let from = String.Index(from16, within: self),
      let to = String.Index(to16, within: self) else {
        return nil
   }

    return from ..< to
  }
}

