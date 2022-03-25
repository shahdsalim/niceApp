//
//  FirstViewController.swift
//  abbartec
//
//  Created by Mac on 10/26/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SafariServices
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func Moqttat(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

           let ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.testurl = "https://www.rbw.sa/scheme"
           self.present(ViewController, animated:true, completion:nil)

//        if let url = URL(string: "https://www.rbw.sa/scheme")
//        {
//
//          let safariVC = SFSafariViewController(url: url)
//          present(safariVC, animated: true, completion: nil)
//
//        }

    }
    
    @IBAction func Mwaeed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
           let ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.testurl = "https://www.rbw.sa/resortweb/"
           self.present(ViewController, animated:true, completion:nil)

//        if let url = URL(string: "https://www.rbw.sa/resortweb/")
//        {
//
//          let safariVC = SFSafariViewController(url: url)
//          present(safariVC, animated: true, completion: nil)
//
//        }
    }
    @IBAction func rejstration(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
           let ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.testurl = "https://www.rbw.sa/public/ijar/"
           self.present(ViewController, animated:true, completion:nil)

        
//        if let url = URL(string: "https://www.rbw.sa/public/ijar/")
//        {
//          let safariVC = SFSafariViewController(url: url)
//          present(safariVC, animated: true, completion: nil)
//        }
    }
    
    @IBAction func tfawl(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
           let ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.testurl = "https://www.rbw.sa/public/rwf/V.html"
           self.present(ViewController, animated:true, completion:nil)


//        if let url = URL(string: "https://www.rbw.sa/public/rwf/V.html")
//        {
//
//          let safariVC = SFSafariViewController(url: url)
//          present(safariVC, animated: true, completion: nil)
//
//        }
    }
}
