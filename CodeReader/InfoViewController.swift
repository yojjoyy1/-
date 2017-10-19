import UIKit
class InfoViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate
{
    //接收辨識到的條碼

    var viewcontroller:ViewController!
    @IBOutlet weak var back: UIImageView!
    @IBOutlet weak var CreateQRCode: UIButton!
    @IBOutlet weak var QRCode: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ShowQRCode: UIButton!
    @IBOutlet weak var radioOut: UITextField!
    @IBOutlet weak var radioIn: UITextField!
    @IBOutlet weak var r: UITextField!
    @IBOutlet weak var g: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var thing: UITextField!
    @IBOutlet weak var classString: UITextField!
    var imageViewBackgroup:UIImageView!
    var ran = UInt(arc4random())
    var imaglogo:UIImageView!
    var btn1:UIButton!
    var btn2:UIButton!
    var btn3:UIButton!
    var imag1:UIImage!
    var imag2:UIImage!
    var radOutFloat:CGFloat = 0.0
    var radInFloat:CGFloat = 0.0
    var image3:UIImage!
    var image4:UIImage!
    var view2 = UIView()
    var viewBool = false
    var thingString = ""
    var classStringText = ""
    var head:head!
    var headTitle = ""
    var headTitleSectionInt = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        back.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        QRCode.delegate = self
        radioOut.delegate = self
        radioIn.delegate = self
        r.delegate = self
        g.delegate = self
        b.delegate = self
        thing.delegate = self
        //image.frame = CGRect(x: 10.0, y: 390.0, width: 200.0, height: 200.0)
        navigationController?.hidesBarsOnSwipe = true
//        CreateQRCode.frame = CGRect(x: 190.0, y: 110.0, width: 119.0, height: 30.0)
//        CreateQRCode.layer.cornerRadius = 5.0
//        CreateQRCode.layer.masksToBounds = true
        QRCode.frame = CGRect(x: 10.0, y: 110.0, width: 170.0, height: 30.0)
        QRCode.autocorrectionType = .no
        let btn1 = UIButton(frame: CGRect(x: 190.0, y: 110.0, width: 119.0, height: 30.0))
        btn1.backgroundColor = CreateQRCode.backgroundColor
        btn1.setTitle("選擇背景圖", for: .normal)
        btn1.tintColor = UIColor.white
        btn1.addTarget(self, action: #selector(btnimage), for: .touchUpInside)
        btn1.layer.cornerRadius = 5.0
        btn1.layer.masksToBounds = true
        view.addSubview(btn1)
        if UserDefaults.standard.bool(forKey: "phone")
        {
            if UserDefaults.standard.bool(forKey: "barCode") == false
            {
                let checkColor = UIButton(frame: CGRect(x: 230.0, y: 270.0, width: 70.0, height: 30.0))
                checkColor.backgroundColor = CreateQRCode.backgroundColor
                checkColor.setTitle("查看顏色", for: .normal)
                checkColor.layer.cornerRadius = 5.0
                checkColor.layer.masksToBounds = true
                checkColor.titleLabel?.adjustsFontSizeToFitWidth = true
                checkColor.addTarget(self, action: #selector(checkColor1), for: .touchUpInside)
                view.addSubview(checkColor)
                r.frame = CGRect(x: 10.0, y: 230.0, width: 70.0, height: 30.0)
                r.placeholder = "< 255 R"
                g.frame = CGRect(x: 90.0, y: 230.0, width: 70.0, height: 30.0)
                g.placeholder = "< 255 G"
                b.frame = CGRect(x: 170.0, y: 230.0, width: 70.0, height: 30.0)
                b.placeholder = "< 255 B"
                radioOut.frame = CGRect(x: 10.0, y: 150.0, width: 170.0, height: 30.0)
                radioOut.placeholder = "輸入QRCode的倒角半徑"
                radioIn.frame = CGRect(x: 10.0, y: 190.0, width: 170.0, height: 30.0)
                radioIn.placeholder = "輸入logo的倒角半徑"
                thing.frame = CGRect(x: 10.0, y: 270.0, width: 190.0, height: 30.0)
                thing.placeholder = "儲存的名稱"
                thing.autocorrectionType = .no
                let btn2 = UIButton(frame: CGRect(x: 190.0, y: 150.0, width: 119.0, height: 30.0))
                btn2.backgroundColor = CreateQRCode.backgroundColor
                btn2.setTitle("選擇logo圖", for: .normal)
                btn2.tintColor = UIColor.white
                btn2.addTarget(self, action: #selector(btnimage2), for: .touchUpInside)
                btn2.layer.cornerRadius = 5.0
                btn2.layer.masksToBounds = true
                view.addSubview(btn2)
                classString.removeFromSuperview()
                ShowQRCode.frame = CGRect(x: 10.0, y: 310.0, width: 150.0, height: 30.0)
                ShowQRCode.layer.cornerRadius = 5.0
                ShowQRCode.layer.masksToBounds = true
                ShowQRCode.setTitle("形成二維碼(QRCode)", for: .normal)
                QRCode.placeholder = "輸入做成QRCode的文字"
            }
            else
            {
                let checkColor = UIButton(frame: CGRect(x: 230.0, y: 220.0, width: 70.0, height: 30.0))
                checkColor.backgroundColor = CreateQRCode.backgroundColor
                checkColor.setTitle("查看顏色", for: .normal)
                checkColor.layer.cornerRadius = 5.0
                checkColor.layer.masksToBounds = true
                checkColor.titleLabel?.adjustsFontSizeToFitWidth = true
                checkColor.addTarget(self, action: #selector(checkColor1), for: .touchUpInside)
                view.addSubview(checkColor)
                r.frame = CGRect(x: 10.0, y: 160.0, width: 70.0, height: 30.0)
                r.placeholder = "< 255 R"
                g.frame = CGRect(x: 90.0, y: 160.0, width: 70.0, height: 30.0)
                g.placeholder = "< 255 G"
                b.frame = CGRect(x: 170.0, y: 160.0, width: 70.0, height: 30.0)
                b.placeholder = "< 255 B"
                radioOut.removeFromSuperview()
                radioIn.removeFromSuperview()
                thing.frame = CGRect(x: 10.0, y: 220.0, width: 190.0, height: 30.0)
                thing.placeholder = "儲存的名稱"
                thing.autocorrectionType = .no
                ShowQRCode.frame = CGRect(x: 10.0, y: 270.0, width: 150.0, height: 30.0)
                ShowQRCode.layer.cornerRadius = 5.0
                ShowQRCode.layer.masksToBounds = true
                ShowQRCode.setTitle("形成一維瑪(BarCode)", for: .normal)
                classString.removeFromSuperview()
                QRCode.placeholder = "輸入做成一維碼的字(英.數)"
                QRCode.adjustsFontSizeToFitWidth = true
                QRCode.keyboardType = .emailAddress
            }
        }
        if UserDefaults.standard.bool(forKey: "cloud")
        {
            if UserDefaults.standard.bool(forKey: "barCode") == false
            {
                let checkColor = UIButton(frame: CGRect(x: 230.0, y: 270.0, width: 70.0, height: 30.0))
                checkColor.backgroundColor = CreateQRCode.backgroundColor
                checkColor.setTitle("查看顏色", for: .normal)
                checkColor.layer.cornerRadius = 5.0
                checkColor.layer.masksToBounds = true
                checkColor.titleLabel?.adjustsFontSizeToFitWidth = true
                checkColor.addTarget(self, action: #selector(checkColor1), for: .touchUpInside)
                view.addSubview(checkColor)
                r.frame = CGRect(x: 10.0, y: 230.0, width: 70.0, height: 30.0)
                r.placeholder = "< 255 R"
                g.frame = CGRect(x: 90.0, y: 230.0, width: 70.0, height: 30.0)
                g.placeholder = "< 255 G"
                b.frame = CGRect(x: 170.0, y: 230.0, width: 70.0, height: 30.0)
                b.placeholder = "< 255 B"
                radioOut.frame = CGRect(x: 10.0, y: 150.0, width: 170.0, height: 30.0)
                radioOut.placeholder = "輸入QRCode的倒角半徑"
                radioIn.frame = CGRect(x: 10.0, y: 190.0, width: 170.0, height: 30.0)
                radioIn.placeholder = "輸入logo的倒角半徑"
                thing.frame = CGRect(x: 10.0, y: 270.0, width: 190.0, height: 30.0)
                thing.placeholder = "儲存的名稱"
                thing.autocorrectionType = .no
                let btn2 = UIButton(frame: CGRect(x: 190.0, y: 150.0, width: 119.0, height: 30.0))
                btn2.backgroundColor = CreateQRCode.backgroundColor
                btn2.setTitle("選擇logo圖", for: .normal)
                btn2.tintColor = UIColor.white
                btn2.addTarget(self, action: #selector(btnimage2), for: .touchUpInside)
                btn2.layer.cornerRadius = 5.0
                btn2.layer.masksToBounds = true
                view.addSubview(btn2)
                ShowQRCode.frame = CGRect(x: 10.0, y: 350.0, width: 150.0, height: 30.0)
                ShowQRCode.layer.cornerRadius = 5.0
                ShowQRCode.layer.masksToBounds = true
                ShowQRCode.setTitle("形成二維碼(QRCode)", for: .normal)
                classString.frame = CGRect(x: 10.0, y: 310.0, width: 119.0, height: 30.0)
                classString.adjustsFontSizeToFitWidth = true
                classString.placeholder = "新增你要的分類"
                classString.autocorrectionType = .no
                classString.delegate = self
                QRCode.placeholder = "輸入做成QRCode的文字"
                view.addSubview(classString)
                
            }
            else
            {
                let checkColor = UIButton(frame: CGRect(x: 230.0, y: 220.0, width: 70.0, height: 30.0))
                checkColor.backgroundColor = CreateQRCode.backgroundColor
                checkColor.setTitle("查看顏色", for: .normal)
                checkColor.layer.cornerRadius = 5.0
                checkColor.layer.masksToBounds = true
                checkColor.titleLabel?.adjustsFontSizeToFitWidth = true
                checkColor.addTarget(self, action: #selector(checkColor1), for: .touchUpInside)
                view.addSubview(checkColor)
                r.frame = CGRect(x: 10.0, y: 160.0, width: 70.0, height: 30.0)
                r.placeholder = "< 255 R"
                g.frame = CGRect(x: 90.0, y: 160.0, width: 70.0, height: 30.0)
                g.placeholder = "< 255 G"
                b.frame = CGRect(x: 170.0, y: 160.0, width: 70.0, height: 30.0)
                b.placeholder = "< 255 B"
                radioOut.removeFromSuperview()
                radioIn.removeFromSuperview()
                thing.frame = CGRect(x: 10.0, y: 220.0, width: 190.0, height: 30.0)
                thing.placeholder = "儲存的名稱"
                thing.autocorrectionType = .no
                ShowQRCode.frame = CGRect(x: 10.0, y: 320.0, width: 150.0, height: 30.0)
                ShowQRCode.layer.cornerRadius = 5.0
                ShowQRCode.layer.masksToBounds = true
                ShowQRCode.setTitle("形成一維碼(BarCode)", for: .normal)
                classString.frame = CGRect(x: 10.0, y: 270.0, width: 119.0, height: 30.0)
                classString.adjustsFontSizeToFitWidth = true
                classString.placeholder = "新增你要的分類"
                classString.autocorrectionType = .no
                classString.delegate = self
                view.addSubview(classString)
                QRCode.placeholder = "輸入做成一維碼的字(英.數)"
                QRCode.adjustsFontSizeToFitWidth = true
                QRCode.keyboardType = .emailAddress
            }
        }
        CreateQRCode.isHidden = true
    }
    
    func bb(head:head)
    {
        self.head = head
    }
    @IBAction func look(_ sender: UIButton)
    {
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "photo") as! photo
        vc1.test(con: self)
        self.present(vc1, animated: true, completion: nil)
       
    }
    @IBAction func CreateQRCode(_ sender: UIButton)
    {
        image.image = QRCodeText(textName: QRCode.text!)
    }
    func QRCodeText(viewc:ViewController)
    {
        self.viewcontroller = viewc
    }
    func QRCodeText(textName:String) -> UIImage?
    {
        let dataa = textName.data(using: String.Encoding.utf8)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let colorFilter = CIFilter(name: "CIFalseColor")
        filter?.setValue(dataa!, forKey: "inputMessage")
        let transfrom = CGAffineTransform(scaleX: 10.0, y: 10.0)
        let output = filter?.outputImage?.applying(transfrom)
        colorFilter!.setDefaults()
        colorFilter!.setValue(output, forKey:kCIInputImageKey)
        if r.text!.isEmpty || g.text!.isEmpty || b.text!.isEmpty
        {
            
            colorFilter?.setValue(CIColor(red: 0, green: 0, blue: 0, alpha: 1.0) , forKey: "inputColor0")
        }
        else
        {
            colorFilter!.setValue(CIColor(red: CGFloat(Int(r.text!)!) / 255.0, green: CGFloat(Int(g.text!)!) / 255.0, blue: CGFloat(Int(b.text!)!) / 255.0, alpha: 1.0),forKey:"inputColor0")
        }
        let colorImgae = colorFilter!.outputImage
        if colorImgae != nil
        {
            UIImageWriteToSavedPhotosAlbum(UIImage(ciImage: colorImgae!), nil, nil, nil)
            return UIImage(ciImage: colorImgae!)
        }
        return nil
    }
    func checkColor1()
    {
        if viewBool == false
        {
            print("viewBool is false")
            viewBool = true
            view2 = UIView(frame: CGRect(x: 250.0, y: r.frame.origin.y, width: 60.0, height: 30.0))
            if r.text!.isEmpty || g.text!.isEmpty || b.text!.isEmpty
            {
                view2.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            }
            else if !r.text!.isEmpty
            {
                view2.backgroundColor = UIColor(red: CGFloat(Int(r.text!)!) / 225.0, green: CGFloat(Int(g.text!)!) / 225.0, blue: CGFloat(Int(b.text!)!) / 225.0, alpha: 1.0)
            }
            view2.layer.cornerRadius = 10.0
            view2.layer.masksToBounds = true
            self.view.addSubview(view2)
            
        }
        else
        {
            self.view2.removeFromSuperview()
            viewBool = false
            
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    func btnimage()
    {
        btn1 = UIButton()
        let alertcontroller = UIAlertController(title: "", message: "選擇選圖方式", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "圖庫", style: .default) { (ok) in
            UserDefaults.standard.set(true, forKey: "test1")
            var popover:UIPopoverPresentationController!
            let imagePicker = UIImagePickerController()
            //設定可以取用所有照片
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            //設定顯示模式為popover
            imagePicker.modalPresentationStyle = .popover
            popover = imagePicker.popoverPresentationController
            //設定popover視窗與哪一個view元件有關連
            popover.sourceView = self.btn1
            //以下兩行處理popover的箭頭位置
            popover.sourceRect = self.btn1.bounds
            popover.permittedArrowDirections = .any
            //顯示相簿畫面
            self.present(imagePicker, animated: true, completion: nil)
        }
        let alertAction2 = UIAlertAction(title: "拍照", style: .default) { (ok) in
            UserDefaults.standard.set(true, forKey: "test3")
            self.btnCamera()
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertcontroller.addAction(alertAction)
        alertcontroller.addAction(alertAction2)
        alertcontroller.addAction(cancel)
        self.present(alertcontroller, animated: true, completion: nil)
    }
    func btnimage2()
    {
        btn2 = UIButton()
        let alertcontroler = UIAlertController(title: "", message: "選擇選圖方式", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "圖庫", style: .default) { (ok) in
            UserDefaults.standard.set(true, forKey: "test2")
            var popover:UIPopoverPresentationController!
            let imagePicker = UIImagePickerController()
            //設定可以取用所有照片
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            //設定顯示模式為popover
            imagePicker.modalPresentationStyle = .popover
            popover = imagePicker.popoverPresentationController
            //設定popover視窗與哪一個view元件有關連
            popover.sourceView = self.btn2
            //以下兩行處理popover的箭頭位置
            popover.sourceRect = self.btn2.bounds
            popover.permittedArrowDirections = .any
            //顯示相簿畫面
            self.present(imagePicker, animated: true, completion: nil)
        }
        let alertAction2 = UIAlertAction(title: "拍照", style: .default) { (ok) in
            UserDefaults.standard.set(true, forKey: "test4")
            self.btnCamera()
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertcontroler.addAction(alertAction)
        alertcontroler.addAction(alertAction2)
        alertcontroler.addAction(cancel)
        self.present(alertcontroler, animated: true, completion: nil)
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        animateTextField(textField: thing, up: true)
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        animateTextField(textField: thing, up: false)
        if UserDefaults.standard.bool(forKey: "barCode") == false
        {
            if textField == radioOut
            {
                if radioOut.text!.isEmpty
                {
                    radOutFloat = 0.0
                }
                else
                {
                    radOutFloat = CGFloat(Int(radioOut.text!)!)
                }
                
            }
            if textField == radioIn
            {
                if radioIn.text!.isEmpty
                {
                    radInFloat = 0.0
                }
                else
                {
                    radInFloat = CGFloat(Int(radioIn.text!)!)
                }
            }
            if textField == thing
            {
                if thing.text!.isEmpty
                {
                    thingString = ""
                }
                else
                {
                    thingString = thing.text!
                }
            }
        }
        else
        {
            if textField == thing
            {
                if thing.text!.isEmpty
                {
                    thingString = ""
                }
                else
                {
                    thingString = thing.text!
                }
            }
        }
    }

    //MARK: UIImagePickerControllerDelegate
    //使用者按下拍照按鈕
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        //取得使用者拍攝的照片
        if UserDefaults.standard.bool(forKey: "test1")
        {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imag1 = UIImage()
            imag1 = image
         
            UserDefaults.standard.removeObject(forKey: "test1")
        }
        if UserDefaults.standard.bool(forKey: "test2")
        {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imag2 = UIImage()
            imag2 = image
         
            UserDefaults.standard.removeObject(forKey: "test2")
        }
        if UserDefaults.standard.bool(forKey: "test3")
        {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            image3 = UIImage()
            image3 = image
            UIImageWriteToSavedPhotosAlbum(image3, nil, nil, nil)
           
            UserDefaults.standard.removeObject(forKey: "test3")
        }
        if UserDefaults.standard.bool(forKey: "test4")
        {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            image4 = UIImage()
            image4 = image
            UIImageWriteToSavedPhotosAlbum(image4, nil, nil, nil)
            print("4")
            UserDefaults.standard.removeObject(forKey: "test4")
        }
        //移除拍照的畫面
        picker.dismiss(animated: true, completion: nil)
    }
    func btnCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let imagePicker = UIImagePickerController()
            
            imagePicker.sourceType = .camera
            
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func animateTextField(textField: UITextField, up: Bool)
    {
        let movementDistance:CGFloat = -100.0
        let movementDuration: Double = 1.0
        
        var movement:CGFloat = 0
        if up
        {
            movement = movementDistance
            navigationController?.navigationBar.isHidden = true
        }
        else
        {
            movement = -movementDistance
            navigationController?.navigationBar.isHidden = false
        }
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    func generateBarcode(from string: String) -> UIImage?
    {
        
        let data = string.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CICode128BarcodeGenerator")
        {
            filter.setValue(data, forKey: "inputMessage")
            let colorFilter = CIFilter(name: "CIFalseColor")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let output = filter.outputImage?.applying(transform)
            colorFilter!.setValue(output, forKey:kCIInputImageKey)
            if r.text!.isEmpty || g.text!.isEmpty || b.text!.isEmpty
            {
                colorFilter?.setValue(CIColor(red: 0, green: 0, blue: 0, alpha: 1.0) , forKey: "inputColor0")
            }
            else
            {
                colorFilter!.setValue(CIColor(red: CGFloat(Int(r.text!)!) / 255.0, green: CGFloat(Int(g.text!)!) / 255.0, blue: CGFloat(Int(b.text!)!) / 255.0, alpha: 1.0),forKey:"inputColor0")
            }
            colorFilter?.setValue(CIColor(red: 1, green: 1, blue: 1, alpha: 1) , forKey: "inputColor1")
            let colorImgae = colorFilter!.outputImage
            let finalImage = UIImage(ciImage: colorImgae!)
            return finalImage
        }
        return nil
    }


}
