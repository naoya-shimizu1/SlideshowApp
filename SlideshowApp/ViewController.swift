//
//  ViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI555 on 2024/04/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var autoButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var nowIndex:Int = 0
    var timer: Timer!
    
    var imageArr:[UIImage] = [
        UIImage(named: "keyCheinAccess")!,
        UIImage(named: "menu")!,
        UIImage(named: "wineCrossOver")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageArr[nowIndex]
        
        imageView.isUserInteractionEnabled = true
    }
    
    @IBAction func goButton(_ sender: Any) {
        nowIndex += 1
        
        if (nowIndex == imageArr.count) {
            nowIndex = 0
        }
        
        imageView.image = imageArr[nowIndex]
    }
    
    @IBAction func backButton(_ sender: Any) {
        if (nowIndex == 0) {
            nowIndex = imageArr.count - 1
        }
        
        else {
            nowIndex -= 1
        }
        
        imageView.image = imageArr[nowIndex]
    }
    
    @IBAction func autoButton(_ sender: Any) {
            if (timer == nil) {
                timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

                autoButton.setTitle("停止", for: .normal)
                goButton.isHidden = true
                backButton.isHidden = true

            } else {
                // 停止時の処理を実装
                // タイマーを停止する
                timer.invalidate()

                // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
                timer = nil

                // ボタンの名前を再生に直しておく
                autoButton.setTitle("再生", for: .normal)
                goButton.isHidden = false
                backButton.isHidden = false
            }
        }
    
    @objc func changeImage() {
        nowIndex += 1
        
        if (nowIndex == imageArr.count) {
            nowIndex = 0
        }
        
        imageView.image = imageArr[nowIndex]
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.image = imageArr[nowIndex]
        
        // スライドショー実行中の場合、スライドショー開始前状態にする
        if goButton.isHidden == true {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            autoButton.setTitle("再生", for: .normal)
            goButton.isHidden = false
            backButton.isHidden = false
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
}

