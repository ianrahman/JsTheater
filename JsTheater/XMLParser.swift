//
//  XMLParser.swift
//  JsTheater
//
//  Created by Ian Rahman on 10/21/16.
//  Copyright © 2016 illyabbi. All rights reserved.
//

import Foundation

struct XMLParser: XMLParserDelegate {
    
    // MARK: - NSXML Parse delegate function
    
    // start parsing document
    func parserDidStartDocument(_ parser: XMLParser) {
        // start parsing
    }
    
    // element start detected
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if elementName == "item" {
            //            postTitle = ""
            //            postLink = ""
            mediaURL = ""
            self.isTagFound["item"] = true
            self.rssRecord = RssRecord()
            
        }else if elementName == "title" {
            self.isTagFound["title"] = true
            
        }else if elementName == "link" {
            self.isTagFound["link"] = true
            
        }else if elementName == "pubDate" {
            self.isTagFound["pubDate"] = true
            
        }else if elementName == "media:thumbnail" {
            self.mediaURL = attributeDict["url"]!
            
        }
        //        return self.mediaURL
    }
    
    // characters received for some element
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if isTagFound["title"] == true {
            self.rssRecord?.title += string
            
        }else if isTagFound["link"] == true {
            self.rssRecord?.link += string
            
        }else if isTagFound["pubDate"] == true {
            self.rssRecord?.pubDate += string
            
            //        }else if isTagFound["media:thumbnail"] == true {
            //            self.rssRecord?.mediaURL += string
            
        }
        
    }
    
    // element end detected
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "item" {
            
            // From asdf
            //            let post = Post()
            //            post.pMediaURL = mediaURL
            //            postsArray.append(post)
            
            self.isTagFound["item"] = false
            self.rssRecordList.append(self.rssRecord!)
            
        }else if elementName == "title" {
            self.isTagFound["title"] = false
            
        }else if elementName == "link" {
            self.isTagFound["link"] = false
            
        }else if elementName == "pubDate" {
            self.isTagFound["pubDate"] = false
            
            //        }else if elementName == "media:thumbnail" {
            //            self.isTagFound["url"] = false
        }
        print("IIIIIIIIIII",mediaURL)
    }
    
    // end parsing document
    func parserDidEndDocument(_ parser: XMLParser) {
        
        //reload table view
        //        self.myTableView.reloadData()
        
        // stop spinner
        //        self.spinner.stopAnimating()
    }
    
    // if any error detected while parsing.
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        
        //  stop animation
        //        self.spinner.stopAnimating()
        
        // show error message
        //        self.showAlertMessage(alertTitle: "Error", alertMessage: "Error while parsing xml.")
        //          tied to line #396-415 below
    }
    
    
    
    
    // MARK: - Utility functions
    
    // load rss and parse it
    fileprivate func loadRSSData(){
        
        if let rssURL = URL(string: RSS_FEED_URL) {
            
            // start spinner
            //            self.spinner.startAnimating()
            
            // fetch rss content from url
            self.myParser = XMLParser(contentsOf: rssURL)!
            
            // set parser delegate
            self.myParser.delegate = self
            self.myParser.shouldResolveExternalEntities = false
            
            // start parsing
            self.myParser.parse()
        }
        
    }
    
}
