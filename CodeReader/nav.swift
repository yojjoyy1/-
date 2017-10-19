//
//  nav.swift
//  CodeReader
//
//  Created by Cxicl on 2017/4/28.
//  Copyright © 2017年 perkinsung. All rights reserved.
//

import UIKit

class nav: UINavigationController
{

    var viewc:ViewController!
    var photo:photo!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func aa(viewc:ViewController)
    {
        self.viewc = viewc
    }

    func aa1(photo:photo)
    {
        self.photo = photo
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        if UserDefaults.standard.bool(forKey: "456")
        {
            UserDefaults.standard.removeObject(forKey: "456")
            let alertcontroll = UIAlertController(title: "", message:  "掃描到的文字為:\(self.viewc.lblInfo.text!)", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "確定", style: .default, handler: { (ok) in
                let aler = UIAlertController(title: "開啟", message: "是否要開啟網頁查看", preferredStyle: .alert)
                let alerOK = UIAlertAction(title: "確定", style: .default, handler: { (okk) in
                    let url = URL(string: self.viewc.lblInfo.text!)
                    if #available(iOS 10.0, *) {
                        return UIApplication.shared.open(url!)
                    } else {
                        UIApplication.shared.openURL(url!)
                    }
                })
                let alerCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                aler.addAction(alerOK)
                aler.addAction(alerCancel)
                self.present(aler, animated: true, completion: nil)
            })
            alertcontroll.addAction(alertAction)
            self.present(alertcontroll, animated: true, completion: nil)
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
