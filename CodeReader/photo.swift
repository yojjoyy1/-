//
//  photo.swift
//  CodeReader
//
//  Created by Cxicl on 2017/4/25.
//  Copyright © 2017年 perkinsung. All rights reserved.
//

import UIKit

class photo: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    var con:InfoViewController!
    var imageViewBackgroup:UIImageView!
    var imaglogo:UIImageView!
    var btn3:UIButton!
    var imageView:UIImageView!
    var saveImageViewImage = [UIImage]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        test(con: con)
        imageViewBackgroup = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        imageViewBackgroup.layoutMargins.bottom = 0.0
        imageViewBackgroup.layoutMargins.left = 0.0
        imageViewBackgroup.layoutMargins.right = 0.0
        imageViewBackgroup.layoutMargins.top = 0.0
        if UserDefaults.standard.bool(forKey: "barCode") == true
        {
            imageView = UIImageView(frame: CGRect(origin: CGPoint(x:25,y:100), size: CGSize(width: 250.0, height: 350.0)))
            imageView.image = con.generateBarcode(from: con.QRCode.text!)
            if con.image3 != nil
            {
                imageViewBackgroup.image = con.image3
                imageViewBackgroup.alpha = 0.7
            }
            else if con.imag1 != nil
            {
                imageViewBackgroup.image = con.imag1
                imageViewBackgroup.alpha = 0.7
            }
            else
            {
                imageViewBackgroup.image = UIImage(named: "icon.png")
                imageViewBackgroup.alpha = 0.7
            }
            view.addSubview(imageViewBackgroup)
            view.addSubview(imageView)
        }
        else
        {
            imageView = UIImageView(frame: CGRect(origin: CGPoint(x:25,y:100), size: CGSize(width: 250.0, height: 350.0)))
            imageView.image = con.QRCodeText(textName: con.QRCode.text!)
            if con.image3 != nil
            {
                imageViewBackgroup.image = con.image3
                imageViewBackgroup.alpha = 0.7
            }
            else if con.imag1 != nil
            {
                imageViewBackgroup.image = con.imag1
                imageViewBackgroup.alpha = 0.7
            }
            else
            {
                imageViewBackgroup.image = UIImage(named: "icon.png")
                imageViewBackgroup.alpha = 0.7
            }
            if con.radOutFloat.isZero
            {
                imageView.layer.cornerRadius = 0
                imageView.layer.masksToBounds = true
            }
            else
            {
                imageView.layer.cornerRadius = con.radOutFloat
                imageView.layer.masksToBounds = true
            }
            imaglogo = UIImageView(frame: CGRect(x: 100.0, y: 155.0, width: 50.0, height: 50.0))
            if con.radInFloat.isZero
            {
                imaglogo.layer.cornerRadius = 0
                imaglogo.layer.masksToBounds = true
            }
            else
            {
                imaglogo.layer.cornerRadius = con.radInFloat
                imaglogo.layer.masksToBounds = true
            }
            if con.image4 != nil
            {
                imaglogo.image = con.image4
            }
            else
            {
                imaglogo.image = con.imag2
            }
            view.addSubview(imageViewBackgroup)
            view.addSubview(imageView)
            imageView.addSubview(imaglogo)
            imageView.bringSubview(toFront: imaglogo)
        }
        btn3 = UIButton()
        var btn4 = UIButton()
        if view.frame.size.height != 480
        {
            btn3.frame = CGRect(x: 10.0, y: 500.0, width: 70.0, height: 30.0)
            btn4 = UIButton(frame: CGRect(x: 200.0, y: 500.0, width: 70.0, height: 30.0))
        }
        else
        {
            btn3.frame = CGRect(x: 10.0, y: 400.0, width: 70.0, height: 30.0)
            btn4 = UIButton(frame: CGRect(x: 200.0, y: 400.0, width: 70.0, height: 30.0))
        }
        btn3.setTitle("返回", for: .normal)
        btn3.layer.cornerRadius = 5.0
        btn3.layer.masksToBounds = true
        btn3.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(btn3)
        view.bringSubview(toFront: btn3)
        btn4.layer.cornerRadius = 5.0
        btn4.layer.masksToBounds = true
        btn4.setTitle("儲存", for: .normal)
        btn4.addTarget(self, action: #selector(save), for: .touchUpInside)
        btn4.tintColor = UIColor.white
        btn4.backgroundColor = UIColor.black
        saveImageViewImage.append(imageView.image!)
        print("第二頁的字串:\(con.headTitle)")
        view.addSubview(btn4)
    }
    func save()
    {
        let main = DispatchQueue.main
        main.async
        {
            let alertcontroller = UIAlertController(title: "", message: "以儲存", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "確定", style: .cancel){ (ok) in
                self.insert()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "nav") as! nav
                vc.aa1(photo: self)
                self.present(vc, animated: true, completion: nil)
            }
            alertcontroller.addAction(alertAction)
            self.present(alertcontroller, animated: true, completion: nil)

        }
    }
    
    func back()
    {
        if btn3.alpha == 1
        {
            btn3.alpha = 0.5
        }
        else
        {
            btn3.alpha = 1
        }
        dismiss(animated: true, completion: nil)
    }

    func test(con:InfoViewController)
    {
        self.con = con
    }
    func insert()
    {
        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, true, 1)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imagaa = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(imagaa!, nil, nil, nil)
        let imagData = UIImageJPEGRepresentation(imagaa!, 0.5)
        if UserDefaults.standard.bool(forKey: "phone")
        {
            let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
            let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
            var db:OpaquePointer? = nil
            var statement:OpaquePointer? = nil
            let Ttable = "CREATE TABLE IF NOT EXISTS phone (id INTEGER PRIMARY KEY AUTOINCREMENT ,text TEXT,thing TEXT,image BLOB);"
            let insert = "INSERT INTO phone ('text','thing','image') values (?,?,?);"
            if sqlite3_open(sqlitePath, &db) == SQLITE_OK
            {
                print("開啟 test")
                let error = sqlite3_errmsg(statement)
                print("error1:\(String(cString: error!))")
                if sqlite3_exec(db, (Ttable as NSString).utf8String, nil, nil, nil) == SQLITE_OK
                {
                    print("資料表新增完成 test")
                }
                if sqlite3_prepare_v2(db, (insert as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
                {
                    sqlite3_bind_text(statement, 1, (self.con.QRCode.text! as NSString).utf8String, -1, nil)
                    sqlite3_bind_text(statement, 2, (self.con.thingString as NSString).utf8String, -1, nil)
                    sqlite3_bind_blob(statement, 3, (imagData! as NSData).bytes, Int32((imagData! as NSData).length), nil)
                    let error = sqlite3_errmsg(statement)
                    print("error1:\(String(cString: error!))")
                    print("\(sqlite3_step(statement))\n\(SQLITE_DONE)")
                    if sqlite3_step(statement) == SQLITE_DONE
                    {
                        print("新增完成 true test")
                    }
                    
                }
                sqlite3_finalize(statement)
                sqlite3_close(db)
            }
        }
        if UserDefaults.standard.bool(forKey: "cloud")
        {
            
        }
        UserDefaults.standard.set(true, forKey: "123")
        print("資料庫已釋放3")

    
    }

}
