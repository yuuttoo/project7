//
//  DetailViewController.swift
//  project7
//
//  Created by mac on 2021/3/18.
//

import UIKit
import WebKit


//做個瀏覽器放資料畫面。直接做成html結構
class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let detailItem = detailItem else { return }
        // Do any additional setup after loading the view.
    
        //把json抓回來的資料放到html結構中
        let html = """
        <html>
        <head>
        <mata name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 350%; } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil) //
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
