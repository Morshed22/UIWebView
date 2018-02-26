//
//  ViewController.swift
//  DemoWEBClick
//
//  Created by Morshed Alam on 7/31/17.
//  Copyright © 2017 Morshed Alam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate = self
        let url = URL(string: "http://game.ggdev.xyz/?profile_id=59280be1c87e5692020585")
        webView.loadRequest(URLRequest(url: url!))
       // webView.loadHTMLString(self.htmlStringFromFile(with: "demo"), baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func htmlStringFromFile(with name: String) -> String {
        let path = Bundle.main.path(forResource: name, ofType: "html")
        if let result = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8) {
            return result
        }
        return ""
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.url?.absoluteString ?? "none")
        if (request.url?.absoluteString.hasPrefix("ios"))!{
            self.getJSValue()
           // return false
            
        }
        return true
    }
    
    func getJSValue() {
        print(self.webView.stringByEvaluatingJavaScript(from: "getGameData()"))
    }
}


