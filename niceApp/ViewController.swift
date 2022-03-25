//
//  ViewController.swift
//  lmne
//
//  Created by Mac on 9/18/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var testurl : String!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    let forwardBarItem = UIBarButtonItem(title: "Forward", style: .plain, target: self,
                                         action: #selector(forwardAction))
    let backBarItem = UIBarButtonItem(title: "Backward", style: .plain, target: self,
                                      action: #selector(backAction))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        webView.navigationDelegate = self
        let myURL = URL(string: "https://www.4-nice.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.addSubview(ActInd)
        ActInd.startAnimating()
        
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
        
    func setupNavItem() {
        self.navigationItem.leftBarButtonItem = backBarItem
        self.navigationItem.rightBarButtonItem = forwardBarItem
    }
        
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .white
    }

    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    @objc func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
        
    @objc func backAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            
            webView.goBack()
            
        }

    }
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            
            webView.goForward()
            
        }

    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webView.reload()

    }
    @IBAction func stop(_ sender: Any) {
        webView.stopLoading()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
          
          ActInd.startAnimating()
        let text = webView.url?.absoluteString
           // .request.url.absoluteString
             print("didCommit",text)

          
      }
      
      func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
          
          ActInd.stopAnimating()
        let text = webView.url?.absoluteString
           // .request.url.absoluteString
             print("didFinish",text)
        

          
      }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url?.absoluteString {
          //urlStr is what you want, I guess.
            print(navigationAction.request.url?.scheme)
                            let urlStr = navigationAction.request.url?.absoluteString
                             print("no link",urlStr)
                            print("no link")
                            decisionHandler(WKNavigationActionPolicy.allow)
//            let http = "\(urlStr)"
//            let https = "http" + http.dropFirst(5)
//            print("decidePolicyForNavigationAction",https)

        print("decidePolicyForNavigationAction",urlStr)

       }
//        decisionHandler(.allow)
    }

      
      func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
          
          ActInd.stopAnimating()
        let text = webView.url?.absoluteString
           // .request.url.absoluteString
             print("didFail",text)

          
      }
    func webViewDidClose(_ webView: WKWebView) {
                let text = webView.url?.absoluteString
           // .request.url.absoluteString
             print("webViewDidClose",text)

    }
    func webViewDidFinishLoad(_ webView: WKWebView) {
        if let currentURL = webView.url?.absoluteString{
            print(currentURL)
        }
    }
    

//    func webViewDidClose(_ webView: WKWebView) {
//                let text = webView.url?.absoluteString
//           // .request.url.absoluteString
//             print("webViewDidClose",text)
//
//    }
//    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//        let text = webView.url?.absoluteString
//          print("webViewWebContentProcessDidTerminate",text)
//
//    }
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        let text = webView.url?.absoluteString
//          print("didStartProvisionalNavigation",text)
//
//    }
//    func webView(_ webView: WKWebView, contextMenuDidEndForElement elementInfo: WKContextMenuElementInfo) {
//                let text = webView.url?.absoluteString
//          print("contextMenuDidEndForElement",text)
//
//    }
//    func webView(_ webView: WKWebView, contextMenuWillPresentForElement elementInfo: WKContextMenuElementInfo) {
//                        let text = webView.url?.absoluteString
//        print("contextMenuWillPresentForElement",text)
//
//    }
//    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
//        let text = webView.url?.absoluteString
//        print("didReceiveServerRedirectForProvisionalNavigation",text)
//
//    }
//    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//                let text = webView.url?.absoluteString
//        print("didFailProvisionalNavigation",text)
//
//    }
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//                        let text = webView.url?.absoluteString
//        print("didReceive challenge",text)
//
//    }
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//                        let text = webView.url?.absoluteString
//        print("decidePolicyFor navigationAction",text)
//
//    }
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//                        let text = webView.url?.absoluteString
//        print("decidePolicyFor",text)
//
//    }
//    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//                        let text = webView.url?.absoluteString
//        print("runJavaScriptAlertPanelWithMessage",text)
//
//    }
//    func webView(_ webView: WKWebView, contextMenuForElement elementInfo: WKContextMenuElementInfo, willCommitWithAnimator animator: UIContextMenuInteractionCommitAnimating) {
//                        let text = webView.url?.absoluteString
//        print("contextMenuForElement",text)
//
//    }
//    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//                        let text = webView.url?.absoluteString
//        print("runJavaScriptConfirmPanelWithMessage",text)
//
//    }
//    func webView(_ webView: WKWebView, contextMenuConfigurationForElement elementInfo: WKContextMenuElementInfo, completionHandler: @escaping (UIContextMenuConfiguration?) -> Void) {
//                        let text = webView.url?.absoluteString
//        print("contextMenuConfigurationForElement",text)
//
//    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        let text = webView.url?.absoluteString
//        print("createWebViewWith",text)
        webView.load(navigationAction.request)

        // don't return a new view to build a popup into (the default behavior).
        return nil;


    }
//    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
//                        let text = webView.url?.absoluteString
//        print("runJavaScriptTextInputPanelWithPrompt",text)
//
//    }
//    func webViewDidFinishLoad(webView: UIWebView){
//        println(WebView.request?.mainDocumentURL)
//    }

}
extension URL {
    var queryDictionary: [String: String]? {
        guard let query = self.query else { return nil}

        var queryStrings = [String: String]()
        for pair in query.components(separatedBy: "&") {

            let key = pair.components(separatedBy: "=")[0]

            let value = pair
                .components(separatedBy:"=")[1]
                .replacingOccurrences(of: "+", with: " ")
                .removingPercentEncoding ?? ""

            queryStrings[key] = value
        }
        return queryStrings
    }
}
