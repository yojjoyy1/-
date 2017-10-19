//
//  head.swift
//  CodeReader
//
//  Created by Cxicl on 2017/4/28.
//  Copyright © 2017年 perkinsung. All rights reserved.
//

import UIKit
import AVFoundation
import LocalAuthentication

class head: UIViewController,UINavigationControllerDelegate,UINavigationBarDelegate,AVAudioPlayerDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate
{
    @IBOutlet weak var collV: UICollectionView!
    var total = [String]()
    var kinda = [String]()
    var thing = [String]()
    var change = false
    var titleText = ["金錢紀錄","事件紀錄"]
    var viewc:ViewController!
    var textString = [String]()
    var textStringT = [String]()
    var l = ""
    var a = ""
    var sectionInt = [String]()
    var titleC = 0
    var labe:UILabel!
    var imageVData = [NSData]()
    var sect0Data = NSData()
    var sectINData = [NSData]()
    var viewPass:UIView!
    var viewPassTitle:UIView!
    var buttonn1:UIButton!
    var buttonn2:UIButton!
    var buttonn3:UIButton!
    var buttonn4:UIButton!
    var buttonn5:UIButton!
    var buttonn6:UIButton!
    var buttonn7:UIButton!
    var buttonn8:UIButton!
    var buttonn9:UIButton!
    var x:Int!
    var label:UILabel!
    var cancel:UIButton!
    var labelView:UIView!
    var passString = ""
    var VerPassString = ""
    var a1 = AVAudioPlayer()
    var sec1 = 0
    var update = false
    var updateVersion = true
//    let db = CKContainer.default().privateCloudDatabase
//    var notes = [CKRecord]()
    private var query:NSMetadataQuery = NSMetadataQuery()
    var Id = [Int]()
    var selectID = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.delegate = self
        VerPassString = ""
        navigationItem.title = "QRCode記事本"
        let button2 = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(back))
        let button3 = UIBarButtonItem(title: "新增/修改", style: .done, target: self, action: #selector(createqrcode))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "狙擊.png"), style: .plain, target: self, action: #selector(qrcode))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        navigationItem.backBarButtonItem = button2
        navigationItem.rightBarButtonItem = button3
        UserDefaults.standard.removeObject(forKey: "phone")
        UserDefaults.standard.removeObject(forKey: "delet")
        collV.delegate = self
        collV.dataSource = self
        collV.frame = CGRect(x: 0, y: 63, width: Int(view.frame.size.width), height: Int(view.frame.size.height))
        collV.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collV.backgroundColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        //collV.backgroundColor = UIColor.red
        kinda = ["本機資料"]
        if !UserDefaults.standard.bool(forKey: "pass")
        {
            print("view:\(view.frame)")
            if view.frame.size.height != 480
            {
                viewPass = UIView(frame: CGRect(x: 10.0, y: 368.0, width: self.view.bounds.size.width - 20, height: 200.0))
                viewPassTitle = UIView(frame: CGRect(x: 0.0, y: 298.0, width: self.view.bounds.size.width, height: 50.0))
                CreatePass(but: buttonn1, x: 0.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.red, selector: #selector(b1))
                CreatePass(but: buttonn2, x: 115.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.orange, selector: #selector(b2))
                CreatePass(but: buttonn3, x: 230.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.yellow, selector: #selector(b3))
                CreatePass(but: buttonn4, x: 0.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.green, selector: #selector(b4))
                CreatePass(but: buttonn5, x: 115.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.init(red: 133/225, green: 196/225, blue: 1, alpha: 1), selector: #selector(b5))
                CreatePass(but: buttonn6, x: 230.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.blue, selector: #selector(b6))
                CreatePass(but: buttonn7, x: 0.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.purple, selector: #selector(b7))
                CreatePass(but: buttonn8, x: 115.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.black, selector: #selector(b8))
                CreatePass(but: buttonn9, x: 230.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.white, selector: #selector(b9))
            }
            else
            {
                viewPass = UIView(frame: CGRect(x: 10.0, y: 250.0, width: self.view.bounds.size.width - 20, height: 200.0))
                viewPassTitle = UIView(frame: CGRect(x: 0.0, y: 182.0, width: self.view.bounds.size.width, height: 50.0))
                CreatePass(but: buttonn1, x: 0.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.red, selector: #selector(b1))
                CreatePass(but: buttonn2, x: 100.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.orange, selector: #selector(b2))
                CreatePass(but: buttonn3, x: 200.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.yellow, selector: #selector(b3))
                CreatePass(but: buttonn4, x: 0.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.green, selector: #selector(b4))
                CreatePass(but: buttonn5, x: 100.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.init(red: 133/225, green: 196/225, blue: 1, alpha: 1), selector: #selector(b5))
                CreatePass(but: buttonn6, x: 200.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.blue, selector: #selector(b6))
                CreatePass(but: buttonn7, x: 0.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.purple, selector: #selector(b7))
                CreatePass(but: buttonn8, x: 100.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.black, selector: #selector(b8))
                CreatePass(but: buttonn9, x: 200.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.white, selector: #selector(b9))
            }
            viewPass.layoutMargins.left = 10.0
            viewPass.layoutMargins.right = 10.0
            viewPass.layoutMargins.bottom = 0.0
            viewPass.alpha = 0.7
            viewPassTitle.layer.cornerRadius = 25.0
            viewPassTitle.layer.masksToBounds = true
            viewPassTitle.backgroundColor = UIColor.white
            viewPassTitle.alpha = 0.7
            view.addSubview(viewPass)
            view.addSubview(viewPassTitle)
            let viewTitleLabel = UILabel(frame: CGRect(x: 20.0, y: 0.0, width: 150.0, height: 35.0))
            viewTitleLabel.text = "請設定輸入密碼(上限為10個)"
            viewTitleLabel.adjustsFontSizeToFitWidth = true
            let OK = UIButton(frame: CGRect(x: 255.0, y: 8.0, width: 50.0, height: 35.0))
            OK.setTitle("完成", for: .normal)
            OK.titleLabel?.adjustsFontSizeToFitWidth = true
            OK.backgroundColor = UIColor.brown
            OK.layer.cornerRadius = 10.0
            OK.layer.masksToBounds = true
            OK.addTarget(self, action: #selector(sure), for: .touchUpInside)
            OK.layoutMargins.right = 0.0
            cancel = UIButton(frame: CGRect(x: 180.0, y: 8.0, width: 65.0, height: 35.0))
            cancel.setTitle("清除/取消", for: .normal)
            cancel.titleLabel?.adjustsFontSizeToFitWidth = true
            cancel.backgroundColor = UIColor.brown
            cancel.layer.cornerRadius = 10.0
            cancel.layer.masksToBounds = true
            cancel.addTarget(self, action: #selector(de), for: .touchUpInside)
            cancel.layoutMargins.right = 10.0
            labelView = UIView(frame: CGRect(x: 20.0, y: 35.0, width: 150.0, height: 15.0))
            viewPassTitle.addSubview(viewTitleLabel)
            viewPassTitle.addSubview(OK)
            viewPassTitle.addSubview(cancel)
            viewPassTitle.addSubview(labelView)
            viewPass.transform = CGAffineTransform.init(translationX: 0.0, y: 618.0)
            viewPassTitle.transform = CGAffineTransform.init(translationX: 0.0, y: 568.0)
            x = 0
            
        }
        else
        {
            qureyPass()
            print("passString:\(passString)")
        }
//        let file = FileManager.default
//        let url2 = file.url(forUbiquityContainerIdentifier: nil)
//        print("url2:\(url2)")
//        DropSQL(table: "qrcode")
//        DropSQL(table: "b")
//        for i in 0...titleSQL.count - 1
//        {
//            DropSQL(table: titleSQL[i])
//        }
        qurey()
        //insr()
    }
    /*
    func insr()
    {
        let record = CKRecord(recordType: "test")
        record.setValue("test", forKey: "d")
        //let privateDatabase = CKContainer.default().privateCloudDatabase
        db.save(record) { (record, err) in
            if err != nil
            {
                print("err:\(err?.localizedDescription)")
            }
            else
            {
                print("record:\(record)")
            }
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: "test", predicate: predicate)
            self.db.perform(query, inZoneWith: nil) { (record, err) in
                if err != nil
                {
                    print("err:\(err?.localizedDescription)")
                }
                else
                {
                    print("record2:\(String(describing: record))")
                }
                
            }
        }

    }
 */
    //MARK:CollectionView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        /*
        let vc = storyboard?.instantiateViewController(withIdentifier: "look") as! look
        l = textString[indexPath.row]
        sect0Data = imageVData[indexPath.row]
        vc.aa(head: self)
        navigationController?.pushViewController(vc, animated: true)
 */
        print("didSelectItemAt")
        let alertController = UIAlertController(title: nil, message: "選擇你要的動作", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "查看", style: .default) { (ok) in
            self.ver()
            UIView.animate(withDuration: 1.0)
            {
                UserDefaults.standard.set(true, forKey: "look")
                self.l = self.textString[indexPath.row]
                self.sect0Data = self.imageVData[indexPath.row]
                self.viewPass.transform = CGAffineTransform.identity
                self.viewPassTitle.transform = CGAffineTransform.identity
            }
        }
        let alertAction2 = UIAlertAction(title: "刪除", style: .default) { (ok2) in
            self.ver()
            UIView.animate(withDuration: 1.0)
            {
                UserDefaults.standard.set(true, forKey: "delet")
                self.selectID = self.Id[indexPath.row]
                self.l = self.textString[indexPath.row]
                self.sect0Data = self.imageVData[indexPath.row]
                self.viewPass.transform = CGAffineTransform.identity
                self.viewPassTitle.transform = CGAffineTransform.identity
            }
        }
        let alertCancel = UIAlertAction(title: "取消", style: .cancel, handler: { (cn) in
            UserDefaults.standard.removeObject(forKey: "delet")
        
            UserDefaults.standard.removeObject(forKey: "look")
        
        })
        alertController.addAction(alertAction)
        alertController.addAction(alertAction2)
        alertController.addAction(alertCancel)
        self.present(alertController, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        switch section
        {
        case 0:
            if thing.isEmpty
            {
                return 0
            }
            else
            {
                return Id.count
            }
        case 1:
            return 0
        default:
            break
        }
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        print("numberOfSections kindaCount:\(kinda.count)")
        return kinda.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headCell", for: indexPath) as! headCell
        if thing.isEmpty
        {
            print("total在cell是空的")
        }
        else
        {
            print("thing cell:\(thing)")
            cell.label.text = thing[indexPath.row]
            cell.imagView.image = UIImage(data: imageVData[indexPath.row] as Data)
            if view.frame.size.width == 375
            {
                cell.imagView.frame.size = CGSize(width: 80, height: 50)
                cell.imagView.frame.origin.x = 35
                cell.imagView.frame.origin.y = 10
                cell.label.center.x = cell.imagView.center.x
                cell.label.frame.origin.y = cell.imagView.center.y + 30
            }
            else if view.frame.size.height == 480
            {
                cell.imagView.frame.size = CGSize(width: 80, height: 50)
                cell.imagView.frame.origin.x = 35
                cell.imagView.frame.origin.y = 10
                cell.label.center.x = cell.imagView.center.x
                cell.label.frame.origin.y = cell.imagView.center.y + 30
            }
            cell.layer.borderWidth = 1
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        if view.frame.size.width == 375
        {
            return UIEdgeInsetsMake(10, 10, 10, 10)
        }
        else
        {
            return UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if view.frame.size.width == 375
        {
            return CGSize(width: 150, height: 100)
        }
        else if view.frame.size.height == 480
        {
            return CGSize(width: 150, height: 100)
        }
        else
        {
            return CGSize(width: 200, height: 100)
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headReusableView", for: indexPath) as! headReusableView
        print("inde:\(indexPath),kind:\(kind)")
        switch kind
        {
        case UICollectionElementKindSectionHeader:
            headerView.frame.size.height = 50
            headerView.frame.size.width = self.view.frame.size.width
            headerView.label.text = kinda[indexPath.section]
            //headerView.label.center = headerView.center
            return headerView
        default:
            break
        }
         return headerView
    }
    func createqrcode()
    {
        if UserDefaults.standard.bool(forKey: "pass")
        {
            UserDefaults.standard.set(true, forKey: "insert")
            ver()
            UIView.animate(withDuration: 1.0)
            {
                self.viewPass.transform = CGAffineTransform.identity
                self.viewPassTitle.transform = CGAffineTransform.identity
            }
        }
    }
    /*
    func start()
    {
        if te == false
        {
            te = true
            let recorder = RPScreenRecorder.shared()
            recorder.startRecording { (error) in
                if error != nil
                {
                    print("error:\(error?.localizedDescription)")
                }
            }
        }
        else
        {
            te = false
            stop()
        }
    }
    func stop()
    {
        let recorder = RPScreenRecorder.shared()
        recorder.stopRecording { (previewVC, error) in
            if let VC = previewVC
            {
                self.present(VC, animated: true, completion: nil)
            }
        }
    }
 */
    
    func qrcode()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    func back()
    {
        navigationController?.popViewController(animated: true)
    }
    //MARK:viewDidAppear
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        if !UserDefaults.standard.bool(forKey: "pass")
        {
            UIView.animate(withDuration: 1.0)
            {
                self.viewPass.transform = CGAffineTransform.identity
                self.viewPassTitle.transform = CGAffineTransform.identity
            }

        }
        VerPassString = ""
        print("viewdidappear")
    }
    //MARK:viewDidDisappear
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        UserDefaults.standard.removeObject(forKey: "delet")
        UserDefaults.standard.removeObject(forKey: "look")
        UserDefaults.standard.removeObject(forKey: "insert")
        UserDefaults.standard.removeObject(forKey: "deletset1")
        UserDefaults.standard.removeObject(forKey: "lookset1")
        print("viewDidDisappear")
    }
    //MARK:queryPass
    
    func qureyPass()
    {
        let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
        let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
        var db:OpaquePointer? = nil
        var statement:OpaquePointer? = nil
        let qurey = "select * from pass;"
        if sqlite3_open(sqlitePath, &db) == SQLITE_OK
        {
            print("資料庫pass開啟")
            if sqlite3_prepare_v2(db, (qurey as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
            {
                while sqlite3_step(statement) == SQLITE_ROW
                {
                    let pass = sqlite3_column_text(statement, 0)
                    let cpass = String(cString: pass!)
                    passString = cpass
                    print("cpass:\(cpass)")
                }
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
            
        }

    }
    /*
    //MARK:queryT
    func qureyT(texts:String,i:Int)
    {
        if sqliteStringT.isEmpty
        {
            print("sqliteStringT.isEmpty")
            sqliteStringT.append(sqliteString[i])
            sectionInt.append(textString[i])
            sectINData.append(imageVData[i])
            let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
            let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
            var db:OpaquePointer? = nil
            var statement:OpaquePointer? = nil
            let qurey = "select * from \(texts);"
            if sqlite3_open(sqlitePath, &db) == SQLITE_OK
            {
                print("資料庫開啟qureyT(texts:\(texts),i:\(i))")
                if sqlite3_prepare_v2(db, (qurey as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
                {
                    print("sqliteStringT.isEmpty->sqlite3_prepare_v2")
                    while sqlite3_step(statement) == SQLITE_ROW
                    {
                        let ids = sqlite3_column_int(statement, 0)
                        let textsa = sqlite3_column_text(statement, 1)
                        let textstring = String(cString: textsa!)
                        let t = sqlite3_column_text(statement, 2)
                        let ct = String(cString: t!)
                        let blob = sqlite3_column_blob(statement, 3)
                        let bty = sqlite3_column_bytes(statement, 3)
                        let imageData = NSData(bytes: blob, length: Int(bty))
                        sqliteStringT.append(ct)
                        sectionInt.append(textstring)
                        sectINData.append(imageData)

                    }
                }
                print("資料庫qureyT(texts:String,i:Int)查詢完成")
                print("資料庫已釋放qureyT(texts:String,i:Int)")
                sqlite3_finalize(statement)
                sqlite3_close(db)
            }

        }
        else
        {
            print("sqliteStringT.isNOTEmpty")
            if self.sec1 == 1
            {
                print("sec1=1")
                self.sec1 = 0
                sqliteStringT.removeAll()
                sectionInt.removeAll()
                sectINData.removeAll()
                iddd.removeAll()
                let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
                let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
                var db:OpaquePointer? = nil
                var statement:OpaquePointer? = nil
                let qurey = "select * from \(texts);"
                print("\(qurey)")
                if sqlite3_open(sqlitePath, &db) == SQLITE_OK
                {
                    print("資料庫開啟qureyT(texts:\(texts),i:\(i))")
                    if sqlite3_prepare_v2(db, (qurey as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
                    {
                        
                        while sqlite3_step(statement) == SQLITE_ROW
                        {
                            print("------------------sec1=1 sqlite_ROW----------------")
                            let id = sqlite3_column_int(statement, 0)
                            let textsa = sqlite3_column_text(statement, 1)
                            let textstring = String(cString: textsa!)
                            let t = sqlite3_column_text(statement, 2)
                            let ct = String(cString: t!)
                            let blob = sqlite3_column_blob(statement, 3)
                            let bty = sqlite3_column_bytes(statement, 3)
                            let imageData = NSData(bytes: blob, length: Int(bty))
                            print("資料庫開啟2textstring:\(textstring)")
                            sqliteStringT.append(ct)
                            sectionInt.append(textstring)
                            sectINData.append(imageData)
                            iddd.append(String(id))
                            print("section:\(sqliteStringT),qureyT(texts:String,i:Int)  id:\(iddd)")
                        }
                    }
                    print("資料庫qureyT(texts:String,i:Int)查詢完成")
                    print("資料庫已釋放2")
                    sqlite3_finalize(statement)
                    sqlite3_close(db)
                }

            }
            else
            {
                print("sec1!=1")
                sqliteStringT.removeAll()
                sectionInt.removeAll()
                sectINData.removeAll()
                iddd.removeAll()
                sqliteStringT.append(sqliteString[i])
                sectionInt.append(textString[i])
                sectINData.append(imageVData[i])
                iddd.append(idd[i])
                let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
                let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
                var db:OpaquePointer? = nil
                var statement:OpaquePointer? = nil
                let qurey = "select * from \(texts);"
                print("query:\(qurey)")
                if sqlite3_open(sqlitePath, &db) == SQLITE_OK
                {
                    print("資料庫開啟qureyT(texts:\(texts),i:\(i))")
                    if sqlite3_prepare_v2(db, (qurey as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
                    {
                        print("sqlite3_prepare_v2->資料庫開啟qureyT(texts:String,i:Int)")
                        while sqlite3_step(statement) == SQLITE_ROW
                        {
                            print("------------------sec1!=1 sqlite_ROW----------------")
                            let id = sqlite3_column_int(statement, 0)
                            let textsa = sqlite3_column_text(statement, 1)
                            let textstring = String(cString: textsa!)
                            let t = sqlite3_column_text(statement, 2)
                            let ct = String(cString: t!)
                            let blob = sqlite3_column_blob(statement, 3)
                            let bty = sqlite3_column_bytes(statement, 3)
                            let imageData = NSData(bytes: blob, length: Int(bty))
                            print("資料庫開啟2textstring:\(textstring)")
                            sqliteStringT.append(ct)
                            sectionInt.append(textstring)
                            sectINData.append(imageData)
                            print("id:\(id)")
                            iddd.append(String(id))
                            print("section:\(sqliteStringT),qureyT(texts:String,i:Int)  id:\(iddd)")
                        }
                    }
                    print("資料庫qureyT(texts:String,i:Int)查詢完成")
                    print("資料庫已釋放2")
                    sqlite3_finalize(statement)
                    sqlite3_close(db)
                }
                
            }

        }
    }
    */
    //MARK:query()
    func qurey()
    {
        if UserDefaults.standard.bool(forKey: "123")
        {
            Id.removeAll()
            textString.removeAll()
            thing.removeAll()
            imageVData.removeAll()
            let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
            let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
            var db:OpaquePointer? = nil
            var statement:OpaquePointer? = nil
            let qurey = "select * from phone;"
            if sqlite3_open(sqlitePath, &db) == SQLITE_OK
            {
                print("資料庫開啟 table is phone")
                if sqlite3_prepare_v2(db, (qurey as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
                {
                    while sqlite3_step(statement) == SQLITE_ROW
                    {
                        let id = sqlite3_column_int(statement, 0)
                        let textClass = sqlite3_column_text(statement, 1)
                        let ctextClass = String(cString: textClass!)
                        let things = sqlite3_column_text(statement, 2)
                        let thingString = String(cString: things!)
                        let blob = sqlite3_column_blob(statement, 3)
                        let bty = sqlite3_column_bytes(statement, 3)
                        let imageData = NSData(bytes: blob, length: Int(bty))
                        Id.append(Int(id))
                        textString.append(ctextClass)
                        thing.append(thingString)
                        imageVData.append(imageData)
                        print("query id=\(id)")
                    }
                    collV.reloadData()
                }
                print("資料庫已釋放phone")
                sqlite3_finalize(statement)
                sqlite3_close(db)
            }
          
        }
 
    }
    /*
    func count1() -> Int
    {
        let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
        let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
        var db:OpaquePointer? = nil
        var statement:OpaquePointer? = nil
        let qurey = "select count (*) from phone;"
        var RowCount = 0
        if sqlite3_open(sqlitePath, &db) == SQLITE_OK
        {
            let error = sqlite3_errmsg(statement)
            print("error1:\(String(cString: error!))\n\(sqlite3_step(statement))")
            if sqlite3_prepare_v2(db, (qurey as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
            {
                if sqlite3_step(statement) == SQLITE_ROW
                {
                    let number = sqlite3_column_int(statement, 0)
                    RowCount = Int(number)
                    print("查詢總數完成count1的總數:\(number)")
                }
            }
            sqlite3_finalize(statement)
            sqlite3_close(db)
            print("資料庫已釋放count1")
        }
        return RowCount
        
    }
 */
    func DropSQL(idd:Int)
    {
        let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
        let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
        var db:OpaquePointer? = nil
        var statement:OpaquePointer? = nil
        let delete = "DELETE FROM phone where id=\(idd);"
        print("delete=\(delete)")
        if sqlite3_open(sqlitePath, &db) == SQLITE_OK
        {
           print("刪除的資料庫連線成功")
            if sqlite3_prepare_v2(db, (delete as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
            {
                if sqlite3_step(statement) == SQLITE_DONE
                {
                    let a = Id.index(of: idd)
                    let b = imageVData.index(of: sect0Data)
                    let c = textString.index(of: self.l)
                    print("a:\(String(describing: a)),b:\(String(describing: b)),c:\(String(describing: c))")
                    self.Id.remove(at: a!)
                    self.imageVData.remove(at: b!)
                    self.textString.remove(at: c!)
                    self.thing.remove(at: a!)
                    print("刪除完成")
                }
                self.collV.reloadData()
            }
            sqlite3_finalize(statement)
            print("資料庫已釋放(刪除)")
            sqlite3_close(db)
        }
    }
 
    func de()
    {
        if !UserDefaults.standard.bool(forKey: "pass")
        {
            if self.x == 0
            {
                viewPassTitle.removeFromSuperview()
                viewPass.removeFromSuperview()
            }
            else
            {
                labelView.subviews.forEach { (d) in
                    d.removeFromSuperview()
                    passString = ""
                }
                x = 0
            }

        }
        else
        {
            if self.x == 0
            {
                viewPass.removeFromSuperview()
                viewPassTitle.removeFromSuperview()
            }
            else
            {
                labelView.subviews.forEach { (d) in
                    d.removeFromSuperview()
                    VerPassString = ""
                }
                x = 0
            }

        }
    }
    func btn1()
    {
        print("x:\(x)")
        x = x + 1
        if UserDefaults.standard.bool(forKey: "pass")
        {
            if x >= 11
            {
                let alertcotroller = UIAlertController(title: "", message: "密碼不能輸入超過10個", preferredStyle: .alert)
                let alerAction = UIAlertAction(title: "確定", style: .default, handler: nil)
                alertcotroller.addAction(alerAction)
                self.present(alertcotroller, animated: true, completion: nil)
                x = 10
            }
            else
            {
                
                label = UILabel(frame: CGRect(x: -15.0 + CGFloat(15 * x), y: 0.0 , width: 15.0, height: 15.0))
                label.text = "*"
                labelView.addSubview(label)
            }
            print("VerpassString:\(VerPassString),passString:\(passString)")
            print("x:\(x)")

        }
        else
        {
            if x >= 11
            {
                let alertcotroller = UIAlertController(title: "", message: "設定密碼不能輸入超過10個", preferredStyle: .alert)
                let alerAction = UIAlertAction(title: "確定", style: .default, handler: nil)
                alertcotroller.addAction(alerAction)
                self.present(alertcotroller, animated: true, completion: nil)
                x = 10
            }
            else
            {
                
                label = UILabel(frame: CGRect(x: -15.0 + CGFloat(15 * x), y: 0.0 , width: 15.0, height: 15.0))
                label.text = "*"
                labelView.addSubview(label)
            }
            print("passString:\(passString)")
            print("x:\(x)")

        }
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        print("audioPlayerDidFinishPlaying:\(flag),\(player)")
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?)
    {
        print("播放失敗:\(error?.localizedDescription),\(player)")
    }
    func b1()
    {
        do{
            let url = Bundle.main.url(forResource: "cat1a", withExtension: "mp3")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            self.a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }
        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("紅")
        }
        else
        {
            passString.append("紅")
        }
        btn1()
        print("a1:\(a1.isPlaying)")
    }
    func b2()
    {
        do{
            let url = Bundle.main.url(forResource: "winny", withExtension: "wav")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            self.a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }
        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("橙")
        }
        else
        {
            passString.append("橙")
        }
        btn1()
    }
    func b3()
    {
        do{
            let url = Bundle.main.url(forResource: "owl", withExtension: "mp3")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }

        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("黃")
        }
        else
        {
            passString.append("黃")
        }
        btn1()
    }
    func b4()
    {
        do{
            let url = Bundle.main.url(forResource: "crow2", withExtension: "mp3")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }

        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("綠")
        }
        else
        {
            passString.append("綠")
        }

        btn1()
    }
    func b5()
    {
        do{
            let url = Bundle.main.url(forResource: "small_dog", withExtension: "mp3")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }

        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("藍")
        }
        else
        {
            passString.append("藍")
        }

        btn1()
    }
    func b6()
    {
        do{
            let url = Bundle.main.url(forResource: "elephant", withExtension: "wav")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }

        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("靛")
        }
        else
        {
            passString.append("靛")
        }

        btn1()
    }
    func b7()
    {
        do{
            let url = Bundle.main.url(forResource: "chicken_3", withExtension: "wav")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }

        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("紫")
        }
        else
        {
            passString.append("紫")
        }

        btn1()
    }
    func b8()
    {
        do{
            let url = Bundle.main.url(forResource: "lion", withExtension: "wav")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }

        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("黑")
        }
        else
        {
            passString.append("黑")
        }

        btn1()
    }
    func b9()
    {
        do{
            let url = Bundle.main.url(forResource: "334", withExtension: "mp3")
            self.a1 = try AVAudioPlayer(contentsOf: url!)
            a1.prepareToPlay()
            a1.delegate = self
            a1.play()
        }
        catch
        {
            print("error1:\(error.localizedDescription)")
        }

        if UserDefaults.standard.bool(forKey: "pass")
        {
            VerPassString.append("白")
        }
        else
        {
            passString.append("白")
        }

        btn1()
    }
    func sure()
    {
        let alertcontroller = UIAlertController(title: "密碼設定", message: "你的密碼已設定完成\n設定完後將無法查詢!!!!\n請妥善保管或紀錄下來\n您的密碼為:\(passString)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "確定", style: .default) { (ok) in
            UserDefaults.standard.set(true, forKey: "pass")
            self.viewPassTitle.removeFromSuperview()
            self.viewPass.removeFromSuperview()
            if self.update == true
            {
                self.update = false
                self.update(NewPass: self.passString)
            }
            else
            {
                let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
                let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
                var db:OpaquePointer? = nil
                var statement:OpaquePointer? = nil
                let Ttable = "CREATE TABLE IF NOT EXISTS pass (passText TEXT);"
                let insert = "INSERT INTO pass ('passText') values (?);"
                if sqlite3_open(sqlitePath, &db) == SQLITE_OK
                {
                    if sqlite3_exec(db, (Ttable as NSString).utf8String, nil, nil, nil) == SQLITE_OK
                    {
                        print("新增pass資料表完成")
                    }
                    if sqlite3_prepare_v2(db, (insert as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
                    {
                        sqlite3_bind_text(statement, 1, (self.passString as NSString).utf8String, -1, nil)
                        if sqlite3_step(statement) == SQLITE_DONE
                        {
                            print("密碼已加入資料庫")
                            sqlite3_finalize(statement)
                            sqlite3_close(db)
                            print("pass資料庫已關閉")
                        }
                    }
                }

            }
        }
        let alertAction2 = UIAlertAction(title: "取消", style: .cancel) { (XXX) in
            UserDefaults.standard.set(false, forKey: "pass")
        }
        alertcontroller.addAction(alertAction)
        alertcontroller.addAction(alertAction2)
        self.present(alertcontroller, animated: true, completion: nil)
     
    }
    func verSure()
    {
        
        if VerPassString == passString
        {
            viewPass.removeFromSuperview()
            viewPassTitle.removeFromSuperview()
            if UserDefaults.standard.bool(forKey: "look")
            {
                UserDefaults.standard.set(true, forKey: "lookset1")
                UserDefaults.standard.removeObject(forKey: "look")
                let vc = storyboard?.instantiateViewController(withIdentifier: "look") as! look
                vc.aa(head: self)
                navigationController?.pushViewController(vc, animated: true)
            }
            else if UserDefaults.standard.bool(forKey: "delet")
            {
                UserDefaults.standard.set(true, forKey: "deletset1")
                UserDefaults.standard.removeObject(forKey: "delet")
                self.DropSQL(idd: self.selectID)
            }
            else if UserDefaults.standard.bool(forKey: "insert")
            {
                let alertcontroller = UIAlertController(title: "", message: "選擇要新增的項目", preferredStyle: .actionSheet)
                let alertAction = UIAlertAction(title: "新增在手機內", style: .default) { (ok) in
                    UserDefaults.standard.removeObject(forKey: "cloud")
                        let alerC = UIAlertController(title: "選擇類型", message: "選擇條碼的樣式", preferredStyle: .alert)
                        let alertA = UIAlertAction(title: "二維碼", style: .default, handler: { (ok) in
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
                            vc.bb(head: self)
                            self.navigationController?.pushViewController(vc, animated: true)
                            //UserDefaults.standard.set(true, forKey: i)
                            UserDefaults.standard.set(true, forKey: "phone")
                            UserDefaults.standard.set(false, forKey: "barCode")
                        })
                        let c = UIAlertAction(title: "一維碼", style: .default, handler: { (br) in
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
                            vc.bb(head: self)
                            self.navigationController?.pushViewController(vc, animated: true)
                            //UserDefaults.standard.set(true, forKey: i)
                            UserDefaults.standard.set(true, forKey: "phone")
                            UserDefaults.standard.set(true, forKey: "barCode")
                        })
                        let d = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                        alerC.addAction(alertA)
                        alerC.addAction(c)
                        alerC.addAction(d)
                        self.present(alerC, animated: true, completion: nil)
                    }
                /*
                let alertAction1 = UIAlertAction(title: "新增在雲端資料庫內", style: .default) { (ok) in
                    UserDefaults.standard.removeObject(forKey: "phone")
                    let alertController = UIAlertController(title: "樣式", message: "選擇條碼的樣式", preferredStyle: .alert)
                    let alertActionQRCode = UIAlertAction(title: "二維碼", style: .default, handler: { (ok) in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
                        vc.bb(head: self)
                        self.navigationController?.pushViewController(vc, animated: true)
                        UserDefaults.standard.set(false, forKey: "barCode")
                        UserDefaults.standard.set(true, forKey: "cloud")
                    })
                    let alertActionBarCode = UIAlertAction(title: "一維碼", style: .default, handler: { (br) in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
                        vc.bb(head: self)
                        self.navigationController?.pushViewController(vc, animated: true)
                        UserDefaults.standard.set(true, forKey: "barCode")
                        UserDefaults.standard.set(true, forKey: "cloud")
                    })
                    let alerActionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                    alertController.addAction(alertActionQRCode)
                    alertController.addAction(alertActionBarCode)
                    alertController.addAction(alerActionCancel)
                    self.present(alertController, animated: true, completion: nil)
                }
 */
                let alertTouchID = UIAlertAction(title: "修改密碼", style: .default) { (ok) in
                    let myContext = LAContext()
                    let myLocalizedReasonString = "放入指紋以辨識認證使用者"
                    var err:NSError? = nil
                    if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &err)
                    {
                        myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString, reply:
                            { (bool, err) in
                                print("bool:\(bool),err:\(err?.localizedDescription)")
                                if bool == true
                                {
                                    self.passString = ""
                                    self.update = true
                                    UserDefaults.standard.set(false, forKey: "pass")
                                    let mainQuqu = DispatchQueue.main
                                    mainQuqu.async
                                    {
                                        self.ver()
                                        UIView.animate(withDuration: 1.0)
                                        {
                                            self.viewPass.transform = CGAffineTransform.identity
                                            self.viewPassTitle.transform = CGAffineTransform.identity
                                        }
                                        
                                    }
                                }
                        })
                    }
                    else
                    {
                        let alertController3 = UIAlertController(title: "指紋辨識", message: "未開啟指紋辨識請先設定指紋辨識", preferredStyle: .alert)
                        let alertAction3 = UIAlertAction(title: "確定", style: .default, handler: { (ok) in
                            let url = URL(string: "App-Prefs:root")
                            if #available(iOS 10.0, *) {
                                return UIApplication.shared.open(url!)
                            } else {
                                UIApplication.shared.openURL(url!)
                            }
                        })
                        let alerAction3Cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                        alertController3.addAction(alertAction3)
                        alertController3.addAction(alerAction3Cancel)
                        self.present(alertController3, animated: true, completion: nil)
                    }
                }
                let alertCancel = UIAlertAction(title: "取消", style: .cancel, handler: { (cancel) in
                    self.x = 0
                    self.VerPassString = ""
                    print("x:\(self.x)")
                })
                alertcontroller.addAction(alertAction)
                //alertcontroller.addAction(alertAction1)
                alertcontroller.addAction(alertTouchID)
                alertcontroller.addAction(alertCancel)
                self.present(alertcontroller, animated: true, completion: nil)
            }
        }
        else
        {
            self.de()
            let alertcontroller = UIAlertController(title: "", message: "密碼不正確請重新輸入密碼", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "確定", style: .default, handler: nil)
            alertcontroller.addAction(alertAction)
            self.present(alertcontroller, animated: true, completion: nil)
        }
    }
    func ver()
    {
        if viewPass == nil
        {
            var OK = UIButton()
            if view.frame.size.height != 480
            {
                viewPass = UIView(frame: CGRect(x: 15.0, y: 420.0, width: self.view.bounds.size.width - 20, height: 230.0))
                 viewPassTitle = UIView(frame: CGRect(x: 0.0, y: 350.0, width: self.view.bounds.size.width, height: 60.0))
                OK = UIButton(frame: CGRect(x: 310.0, y: 8.0, width: 50.0, height: 50.0))
                cancel = UIButton(frame: CGRect(x: 235.0, y: 8.0, width: 65.0, height: 50.0))
                CreatePass(but: buttonn1, x: 0.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.red, selector: #selector(b1))
                CreatePass(but: buttonn2, x: 115.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.orange, selector: #selector(b2))
                CreatePass(but: buttonn3, x: 230.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.yellow, selector: #selector(b3))
                CreatePass(but: buttonn4, x: 0.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.green, selector: #selector(b4))
                CreatePass(but: buttonn5, x: 115.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.init(red: 133/225, green: 196/225, blue: 1, alpha: 1), selector: #selector(b5))
                CreatePass(but: buttonn6, x: 230.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.blue, selector: #selector(b6))
                CreatePass(but: buttonn7, x: 0.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.purple, selector: #selector(b7))
                CreatePass(but: buttonn8, x: 115.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.black, selector: #selector(b8))
                CreatePass(but: buttonn9, x: 230.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.white, selector: #selector(b9))
            }
            else
            {
                viewPass = UIView(frame: CGRect(x: 10.0, y: 250.0, width: self.view.bounds.size.width - 20, height: 200.0))
                viewPassTitle = UIView(frame: CGRect(x: 0.0, y: 182.0, width: self.view.bounds.size.width, height: 50.0))
                OK = UIButton(frame: CGRect(x: 255.0, y: 8.0, width: 50.0, height: 35.0))
                cancel = UIButton(frame: CGRect(x: 180.0, y: 8.0, width: 65.0, height: 35.0))
                CreatePass(but: buttonn1, x: 0.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.red, selector: #selector(b1))
                CreatePass(but: buttonn2, x: 100.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.orange, selector: #selector(b2))
                CreatePass(but: buttonn3, x: 200.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.yellow, selector: #selector(b3))
                CreatePass(but: buttonn4, x: 0.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.green, selector: #selector(b4))
                CreatePass(but: buttonn5, x: 100.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.init(red: 133/225, green: 196/225, blue: 1, alpha: 1), selector: #selector(b5))
                CreatePass(but: buttonn6, x: 200.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.blue, selector: #selector(b6))
                CreatePass(but: buttonn7, x: 0.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.purple, selector: #selector(b7))
                CreatePass(but: buttonn8, x: 100.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.black, selector: #selector(b8))
                CreatePass(but: buttonn9, x: 200.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.white, selector: #selector(b9))
            }
            self.x = 0
            VerPassString = ""
            viewPass.layoutMargins.left = 10.0
            viewPass.layoutMargins.right = 10.0
            viewPass.layoutMargins.bottom = 0.0
            viewPass.alpha = 0.7
            //viewPass.backgroundColor = UIColor.red
            viewPassTitle.layer.cornerRadius = viewPassTitle.bounds.size.height / 2
            viewPassTitle.layer.masksToBounds = true
            viewPassTitle.backgroundColor = UIColor.white
            viewPassTitle.alpha = 0.7
            view.addSubview(viewPass)
            
            view.addSubview(viewPassTitle)
            let viewTitleLabel = UILabel(frame: CGRect(x: 20.0, y: 0.0, width: 150.0, height: 35.0))
            if update == true
            {
                viewTitleLabel.text = "請輸入新的密碼(上限為10個)"
            }
            else
            {
                viewTitleLabel.text = "請輸入密碼(上限為10個)"
            }
            viewTitleLabel.adjustsFontSizeToFitWidth = true
            
            OK.setTitle("完成", for: .normal)
            OK.titleLabel?.adjustsFontSizeToFitWidth = true
            OK.backgroundColor = UIColor.brown
            OK.layer.cornerRadius = 10.0
            OK.layer.masksToBounds = true
            OK.layoutMargins.right = 0.0
            if update == true
            {
                OK.addTarget(self, action: #selector(sure), for: .touchUpInside)
            }
            else
            {
                OK.addTarget(self, action: #selector(verSure), for: .touchUpInside)
            }
            
            cancel.setTitle("清除/取消", for: .normal)
            cancel.titleLabel?.adjustsFontSizeToFitWidth = true
            cancel.backgroundColor = UIColor.brown
            cancel.layer.cornerRadius = 10.0
            cancel.layer.masksToBounds = true
            cancel.addTarget(self, action: #selector(de), for: .touchUpInside)
            cancel.layoutMargins.right = 10.0
            labelView = UIView(frame: CGRect(x: 20.0, y: 35.0, width: 150.0, height: 15.0))
            viewPassTitle.addSubview(viewTitleLabel)
            viewPassTitle.addSubview(OK)
            viewPassTitle.addSubview(cancel)
            viewPassTitle.addSubview(labelView)
            viewPass.transform = CGAffineTransform.init(translationX: 0.0, y: 618.0)
            viewPassTitle.transform = CGAffineTransform.init(translationX: 0.0, y: 568.0)
           
        }
        else
        {
           
            viewPass.removeFromSuperview()
            viewPassTitle.removeFromSuperview()
            self.x = 0
            VerPassString = ""
            var OK = UIButton()
            if view.frame.size.height != 480
            {
                viewPass = UIView(frame: CGRect(x: 15.0, y: 420.0, width: self.view.bounds.size.width - 20, height: 230.0))
                viewPassTitle = UIView(frame: CGRect(x: 0.0, y: 350.0, width: self.view.bounds.size.width, height: 60.0))
                OK = UIButton(frame: CGRect(x: 310.0, y: 8.0, width: 50.0, height: 50.0))
                cancel = UIButton(frame: CGRect(x: 235.0, y: 8.0, width: 65.0, height: 50.0))
                CreatePass(but: buttonn1, x: 0.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.red, selector: #selector(b1))
                CreatePass(but: buttonn2, x: 115.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.orange, selector: #selector(b2))
                CreatePass(but: buttonn3, x: 230.0, y: 0.0, w: 115.0, h: 76.0, color: UIColor.yellow, selector: #selector(b3))
                CreatePass(but: buttonn4, x: 0.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.green, selector: #selector(b4))
                CreatePass(but: buttonn5, x: 115.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.init(red: 133/225, green: 196/225, blue: 1, alpha: 1), selector: #selector(b5))
                CreatePass(but: buttonn6, x: 230.0, y: 76.0, w: 115.0, h: 76.0, color: UIColor.blue, selector: #selector(b6))
                CreatePass(but: buttonn7, x: 0.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.purple, selector: #selector(b7))
                CreatePass(but: buttonn8, x: 115.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.black, selector: #selector(b8))
                CreatePass(but: buttonn9, x: 230.0, y: 152.0, w: 115.0, h: 76.0, color: UIColor.white, selector: #selector(b9))
            }
            else
            {
                viewPass = UIView(frame: CGRect(x: 10.0, y: 250.0, width: self.view.bounds.size.width - 20, height: 200.0))
                viewPassTitle = UIView(frame: CGRect(x: 0.0, y: 182.0, width: self.view.bounds.size.width, height: 50.0))
                OK = UIButton(frame: CGRect(x: 255.0, y: 8.0, width: 50.0, height: 35.0))
                cancel = UIButton(frame: CGRect(x: 180.0, y: 8.0, width: 65.0, height: 35.0))
                CreatePass(but: buttonn1, x: 0.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.red, selector: #selector(b1))
                CreatePass(but: buttonn2, x: 100.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.orange, selector: #selector(b2))
                CreatePass(but: buttonn3, x: 200.0, y: 0.0, w: 100.0, h: 66.0, color: UIColor.yellow, selector: #selector(b3))
                CreatePass(but: buttonn4, x: 0.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.green, selector: #selector(b4))
                CreatePass(but: buttonn5, x: 100.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.init(red: 133/225, green: 196/225, blue: 1, alpha: 1), selector: #selector(b5))
                CreatePass(but: buttonn6, x: 200.0, y: 66.0, w: 100.0, h: 66.0, color: UIColor.blue, selector: #selector(b6))
                CreatePass(but: buttonn7, x: 0.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.purple, selector: #selector(b7))
                CreatePass(but: buttonn8, x: 100.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.black, selector: #selector(b8))
                CreatePass(but: buttonn9, x: 200.0, y: 132.0, w: 100.0, h: 66.0, color: UIColor.white, selector: #selector(b9))
            }
            viewPass.layoutMargins.left = 10.0
            viewPass.layoutMargins.right = 10.0
            viewPass.layoutMargins.bottom = 0.0
            viewPass.alpha = 0.7
            viewPassTitle.layer.cornerRadius = viewPassTitle.bounds.size.height / 2
            viewPassTitle.layer.masksToBounds = true
            viewPassTitle.backgroundColor = UIColor.white
            viewPassTitle.alpha = 0.7
            view.addSubview(viewPass)
            view.addSubview(viewPassTitle)
            let viewTitleLabel = UILabel(frame: CGRect(x: 20.0, y: 0.0, width: 150.0, height: 35.0))
            if update == true
            {
                viewTitleLabel.text = "請輸入新的密碼(上限為10個)"
            }
            else
            {
                viewTitleLabel.text = "請輸入密碼(上限為10個)"
            }
            viewTitleLabel.adjustsFontSizeToFitWidth = true
            
            OK.setTitle("完成", for: .normal)
            OK.titleLabel?.adjustsFontSizeToFitWidth = true
            OK.backgroundColor = UIColor.brown
            OK.layer.cornerRadius = 10.0
            OK.layer.masksToBounds = true
            OK.layoutMargins.right = 0.0
            if update == true
            {
                OK.addTarget(self, action: #selector(sure), for: .touchUpInside)
            }
            else
            {
                OK.addTarget(self, action: #selector(verSure), for: .touchUpInside)
            }
            
            cancel.setTitle("清除/取消", for: .normal)
            cancel.titleLabel?.adjustsFontSizeToFitWidth = true
            cancel.backgroundColor = UIColor.brown
            cancel.layer.cornerRadius = 10.0
            cancel.layer.masksToBounds = true
            cancel.addTarget(self, action: #selector(de), for: .touchUpInside)
            cancel.layoutMargins.right = 10.0
            labelView = UIView(frame: CGRect(x: 20.0, y: 35.0, width: 150.0, height: 15.0))
            viewPassTitle.addSubview(viewTitleLabel)
            viewPassTitle.addSubview(OK)
            viewPassTitle.addSubview(cancel)
            viewPassTitle.addSubview(labelView)
            viewPass.transform = CGAffineTransform.init(translationX: 0.0, y: 618.0)
            viewPassTitle.transform = CGAffineTransform.init(translationX: 0.0, y: 568.0)
        }
    }

    func CreatePass(but:UIButton!,x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat,color:UIColor,selector:Selector)
    {
        let but = UIButton(frame: CGRect(x: x, y: y, width: w, height: h))
        but.backgroundColor = color
        but.addTarget(self, action: selector, for: .touchUpInside)
        viewPass.addSubview(but)
    }
    //BarCode
    func generateBarcode(from string: String) -> UIImage?
    {
        
        let data = string.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CICode128BarcodeGenerator")
        {
            filter.setValue(data, forKey: "inputMessage")
            let colorFilter = CIFilter(name: "CIFalseColor")
            //Scaling
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let output = filter.outputImage?.applying(transform)
            colorFilter!.setValue(output, forKey:kCIInputImageKey)
            colorFilter?.setValue(CIColor(red: 100/255, green: 168/255, blue: 100/255, alpha: 1.0) , forKey: "inputColor0")
            colorFilter?.setValue(CIColor(red: 1, green: 1, blue: 1, alpha: 1.0) , forKey: "inputColor1")
            let colorImgae = colorFilter!.outputImage
            let finalImage = UIImage(ciImage: colorImgae!)
            return finalImage
        }
        return nil
    }
    func update(NewPass:String)
    {
        let urls = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
        let sqlitePath = urls[urls.count-1].absoluteString + "QRCode.db"
        var db:OpaquePointer? = nil
        var statement:OpaquePointer? = nil
        let Ttable = "CREATE TABLE IF NOT EXISTS pass (passText TEXT);"
        let update = "UPDATE pass SET passText = '\(NewPass)';"
        if sqlite3_open(sqlitePath, &db) == SQLITE_OK
        {
            if sqlite3_exec(db, (Ttable as NSString).utf8String, nil, nil, nil) == SQLITE_OK
            {
                print("新增updatepass資料表完成")
            }
            if sqlite3_prepare_v2(db, (update as NSString).utf8String, -1, &statement, nil) == SQLITE_OK
            {
                sqlite3_bind_text(statement, 1, (self.passString as NSString).utf8String, -1, nil)
                if sqlite3_step(statement) == SQLITE_DONE
                {
                    print("密碼已修改成功並加入資料庫")
                    sqlite3_finalize(statement)
                    sqlite3_close(db)
                    print("pass資料庫已關閉")
                }
            }
        }

    }
    //MARK:檢測icoud功能
    func iCloudDocumentURL() -> URL?
    {
        let fileManager = FileManager.default
        if let url = fileManager.url(forUbiquityContainerIdentifier: nil)
        {
            return url.appendingPathComponent("Documents")
        }
        return nil
    }
    /*
    func loadDocuments()->Bool
    {
        let baseURL = self.iCloudDocumentURL()
        guard baseURL != nil else
        {
            return false
        }
        let center = NotificationCenter.default
        query.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
        query.predicate = NSPredicate(value: true)
        center.addObserver(self, selector: #selector(metadataQueryDidFinishGathering), name: NSNotification.Name.NSMetadataQueryDidFinishGathering, object: nil)
        self.query.enableUpdates()
        query.start()
        return true
    }
 */
    /*
    func metadataQueryDidFinishGathering()
    {
        query.disableUpdates()
        query.stop()
        let center = NotificationCenter.default
        center.removeObserver(self)
        var diaryList = Array<Any>()
        var diaries : Array<Dictionary<String, Any>>!
        if (query.resultCount == 1)
        {
            let item = query.results.first as! NSMetadataItem
            let fileURL = item.value(forAttribute: NSMetadataItemURLKey) as! URL
            let document = UIDocument(fileURL: fileURL )
            document.open(completionHandler: { (success) in
                for dic in document.diaries
                {
                    let diary = Diary(dic: dic)
                    diaryList.append(diary)
                }
                self.delegate?.queryDocumentsComplete(results: diaryList)
                document.close(completionHandler: nil)
            })
            
        }
        else
        {
            self.delegate?.queryDocumentsComplete(results: diaryList)
        }
    }
 */
    /*
    func files_saveImage(imageUUID2Save: String)
    {
        var localChanges:[CKRecord] = []
        let image2updated = sharedDataAccess.image2Cloud[imageUUID2Save]
        
        let newRecordID = CKRecordID(recordName: imageUUID2Save)
        let newRecord = CKRecord(recordType: "Image", recordID: newRecordID)
        
        let theLinkID = CKReference(recordID: sharedDataAccess.iCloudID, action: .deleteSelf)
        let thePath = sharedDataAccess.fnGet(index2seek: sharedDataAccess.currentSN)
        newRecord["theLink"] = theLinkID
        newRecord["theImageNo"] = image2updated?.imageI as CKRecordValue?
        newRecord["theImagePath"] = sharedDataAccess.fnGet(index2seek: image2updated?.imageS as! Int) as CKRecordValue?
        newRecord["theUUID"] = imageUUID2Save as CKRecordValue?
        
        let theURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(NSUUID().uuidString+".dat")
        do
        {
            try image2updated?.imageD.write(to: theURL!)
        }
        catch let e as NSError
        {
            print("Error! \(e)");
            return
        }
    }
 */

}
