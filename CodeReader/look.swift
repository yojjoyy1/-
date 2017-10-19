//
//  look.swift
//  CodeReader
//
//  Created by Cxicl on 2017/4/28.
//  Copyright © 2017年 perkinsung. All rights reserved.
//

import UIKit

class look: UIViewController
{

    var head:head!
    var textlabel:UILabel!
    var textV:UITextView!
    @IBOutlet weak var backimage: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        backimage.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
//        textlabel = UILabel(frame: CGRect(x: 10.0, y: 50.0, width: 300.0, height: 200.0))
//        textlabel.adjustsFontSizeToFitWidth = true
//        textlabel.numberOfLines = 100
//        textlabel.text = "你的QRCode內的資料為:\(head.l)"
        //textlabel.textColor = UIColor.red
        
        if view.frame.size.height != 480
        {
            textV = UITextView(frame: CGRect(x: 10.0, y: 60.0, width: 350.0, height: 200.0))
            textV.text = "你的QRCode內的資料為:\(head.l)"
            let imageV = UIImageView(frame: CGRect(x: 10.0, y: 280.0, width: 350.0, height: 270.0))
            imageV.image = UIImage(data: head.sect0Data as Data)
            view.addSubview(imageV)
        }
        else
        {
            textV = UITextView(frame: CGRect(x: 10.0, y: 60.0, width: 300.0, height: 200.0))
            textV.text = "你的QRCode內的資料為:\(head.l)"
            let imageV = UIImageView(frame: CGRect(x: 10.0, y: 270.0, width: 300.0, height: 200.0))
            imageV.image = UIImage(data: head.sect0Data as Data)
            view.addSubview(imageV)
        }
        textV.isEditable = false
        textV.isSelectable = false
        backimage.layoutMargins.bottom = 0
        view.backgroundColor = UIColor.cyan
        view.addSubview(textV)
        print("data:\(head.sect0Data as Data)")
        if UserDefaults.standard.bool(forKey: "lookset1")
        {
            UserDefaults.standard.removeObject(forKey: "lookset1")
        }
    }

    func aa(head:head)
    {
        self.head = head
    }
}
