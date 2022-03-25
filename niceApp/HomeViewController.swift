//
//  HomeViewController.swift
//  lmne
//
//  Created by Mac on 9/29/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController, WKUIDelegate {

private var webView = WKWebView(frame: CGRect.zero, configuration: WKWebViewConfiguration())

override func viewDidLoad() {
    super.viewDidLoad()

    // set the delegate for webView
    webView.uiDelegate = self

    // define URL
    let myURL = URL(string:"https://www.apple.com")

    // create request
    let myRequest = URLRequest(url: myURL!)

    // show request
    webView.load(myRequest)

    // make webView ready for Autolayout
    webView.translatesAutoresizingMaskIntoConstraints = false

    // add webView to view
    view.addSubview(webView)

    // size the webView beeing 75 % of the screen
    webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    webView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.95).isActive = true
    }
}
