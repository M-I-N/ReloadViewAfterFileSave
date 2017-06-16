//
//  CustomXMLParser.swift
//  ReloadViewAfterFileSave
//
//  Created by Nayem BJIT on 6/15/17.
//  Copyright © 2017 Nayem BJIT. All rights reserved.
//

import UIKit

class CustomXMLParser: NSObject {
    
    func parseAndSave(completion: @escaping (String)-> Void ) {
        let when = DispatchTime.now() + 10
        DispatchQueue.global().asyncAfter(deadline: when) {
            let string = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            // get the document directory
            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("myFile").appendingPathExtension("txt")
            
            do {
                // write to filepath
                try string.write(to: fileURL!, atomically: true, encoding: .utf8)
                DispatchQueue.main.async {
                    completion((fileURL?.path)!)
                }
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }

}
