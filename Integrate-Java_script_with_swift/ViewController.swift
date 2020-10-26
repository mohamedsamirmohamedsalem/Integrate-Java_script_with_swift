//
//  ViewController.swift
//  Integrate-Java_script_with_swift
//
//  Created by Mohamed Samir on 10/26/20.
//  Copyright © 2020 Mohamed Samir. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKUIDelegate , WKScriptMessageHandler  {
    
    

    @IBOutlet weak var webKitView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let url = Bundle.main.url(forResource: "htmlFile", withExtension: "html") {
            webKitView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        
        let contentController = self.webKitView.configuration.userContentController
        contentController.add(self, name: "toggleMessageHandler")
    }

    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        guard let dict = message.body as? [String : AnyObject] else {
            return
        }

        print(dict)
        
    }
    

}

