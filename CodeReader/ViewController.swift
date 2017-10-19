import UIKit
import AVFoundation
import AudioToolbox
class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate
{
    @IBOutlet weak var lblInfo: UILabel!
    //宣告影像擷取資料流（從輸入到輸出）
    var captureSession:AVCaptureSession!
    //宣告影像影像預覽層
    var videoPreviewLayer:AVCaptureVideoPreviewLayer!
    //宣告偵測QRCode或BarCode的視窗
    var codeFrameView:UIView!
    //定義支援的QRCode或Barcode
    let supportedBarCodes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeUPCECode,AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode, AVMetadataObjectTypePDF417Code]
    //初始化AVCaptureMetadataOutput物件，並將其設定為session的輸出裝置
    let captureMetaDataOutput = AVCaptureMetadataOutput()
    /*
     AVFoundation框架支援以下型式的條碼：
     UPC-E (AVMetadataObjectTypeUPCECode)
     Code 39 (AVMetadataObjectTypeCode39Code)
     Code 39 mod 43 (AVMetadataObjectTypeCode39Mod43Code)
     Code 93 (AVMetadataObjectTypeCode93Code)
     Code 128 (AVMetadataObjectTypeCode128Code)
     EAN-8 (AVMetadataObjectTypeEAN8Code)
     EAN-13 (AVMetadataObjectTypeEAN13Code)
     Aztec (AVMetadataObjectTypeAztecCode)
     PDF417 (AVMetadataObjectTypePDF417Code)
     */
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = "QRCode掃描裝置"
        //初始化影像擷取裝置
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        //初始化『影像擷取資料流』
        captureSession = AVCaptureSession()
        //宣告影像輸入裝置
        let videoInput:AVCaptureDeviceInput!
        do
        {
            //取得影像輸入裝置
            videoInput = try? AVCaptureDeviceInput(device: captureDevice)
            if self.captureSession.canAddInput(videoInput)
            {
                //將『影像輸入裝置』加入『影像擷取資料流』
                captureSession.addInput(videoInput)
                print("Input seccess")
            }
            else
            {
                print("Input fail")
            }
            if self.captureSession.canAddOutput(captureMetaDataOutput)
            {
                //將『影像輸出裝置』加入『影像擷取資料流』
                captureSession.addOutput(captureMetaDataOutput)
                //設定『影像輸出裝置』的代理人，並使用主要佇列來呼叫代理事件
                captureMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                //指定可以支援的QRCode或BarCode
                captureMetaDataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
                print("Output seccess")
            }
            else
            {
                print("Output fail")
            }
            codeFrameView = UIView()
            codeFrameView.frame = CGRect(origin: CGPoint(x:0.0,y:0.0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height))
            codeFrameView.layer.borderColor = UIColor.green.cgColor
            codeFrameView.layer.borderWidth = 3
            codeFrameView.layer.cornerRadius = 10.0
            codeFrameView.layer.masksToBounds = true
            view.addSubview(codeFrameView)
            view.bringSubview(toFront: codeFrameView)
            //製作影像預覽層
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
            //設定影像預覽層的大小
            videoPreviewLayer.frame = codeFrameView.frame
            //設定影像預覽層的呈現方式（縮放模式）
            videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            //加入影像預覽層
            view.layer.addSublayer(videoPreviewLayer)
            captureSession.startRunning()
            //將訊息標籤往上提（避免被『影像預覽層』蓋住）
            view.bringSubview(toFront: lblInfo)
            //建立一個條碼辨識的小視窗，邊框為綠色（注意：目前沒有frame為不可見！）
            print("codeFramView:\(codeFrameView)")
        }
        catch
        {
            print(error.localizedDescription)
            return  //有錯誤就返回
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        if captureSession.isRunning == false
        {
            captureSession.startRunning()
            print("startRunning")
        }
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        if captureSession.isRunning == true
        {
            captureSession.stopRunning()
            print("stopRunning")
        }
    }
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!)
    {
        // 檢查 metadataObjects 陣列是否為非空值，它至少需包含一個物件
        if metadataObjects == nil || metadataObjects.count == 0
        {
            codeFrameView?.frame = CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: 0.0, height: 0.0))
            lblInfo.text = "沒有任何資訊"
            return
        }
        // 取得元資料（metadata）物件
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        print("sa:\(metadataObjects.count)")
        for i in supportedBarCodes
        {
            if metadataObj.type == i
            {
                //倘若發現的原資料與 QR code 原資料相同，便更新狀態標籤的文字並設定邊界
                let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj as
                    AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
                codeFrameView?.frame = barCodeObject.bounds
                print("\(metadataObj.type)")
                if metadataObj.stringValue != nil
                {
                    lblInfo.text = metadataObj.stringValue
                    print("metadataObj:\(metadataObj.corners)")
                    print("text:\(String(describing: lblInfo.text))")
                    if lblInfo.text == metadataObj.stringValue
                    {
                        let soundID = SystemSoundID(kSystemSoundID_Vibrate)
                        AudioServicesPlaySystemSound(soundID)
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "nav") as! nav
                        vc.aa(viewc: self)
                        self.present(vc, animated: true, completion: nil)
                        UserDefaults.standard.set(true, forKey: "456")
                    }
                }
            }

        }
    }
        
}

