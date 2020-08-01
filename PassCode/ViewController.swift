//
//  ViewController.swift
//  PassCode
//
//  Created by 李世文 on 2020/7/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    //產生實心星星、空心星星
    let starFillImage = UIImage(systemName: "star.fill")
    let starImage = UIImage(systemName: "star")
    //密碼
    var passCode = "0204"
    var inputPassCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func numberInputButton(_ sender: UIButton) {
        //使用者密碼組成
        if let buttonNum = sender.currentTitle, buttonNum != ""{
            inputPassCode += buttonNum
        }
        //設定星星圖案
        switch inputPassCode.count {
        case 1:
            star1.image = starFillImage
        case 2:
            star2.image = starFillImage
        case 3:
            star3.image = starFillImage
        case 4:
            star4.image = starFillImage
            //比對密碼
            if inputPassCode == passCode {
                alertMessage()
            }else{
                inputPassCode = ""
                star1.image = starImage
                star2.image = starImage
                star3.image = starImage
                star4.image = starImage
            }
        default:
            break
        }
        
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        switch inputPassCode.count {
        case 1:
            inputPassCode = ""
            star1.image = starImage
        case 2:
            inputPassCode.removeLast()
            star2.image = starImage
        case 3:
            inputPassCode.removeLast()
            star3.image = starImage
        case 4:
            inputPassCode.removeLast()
            star4.image = starImage
        default:
            break
        }
    }
    
    func alertMessage() {
        let alertController = UIAlertController(title: "解鎖成功", message: "很會猜喔！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.inputPassCode = ""
            self.star1.image = self.starImage
            self.star2.image = self.starImage
            self.star3.image = self.starImage
            self.star4.image = self.starImage
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    

}

