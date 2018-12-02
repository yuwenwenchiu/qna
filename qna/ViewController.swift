//
//  ViewController.swift
//  qna
//
//  Created by Yuwen Chiu on 2018/12/2.
//  Copyright © 2018 YuwenChiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //建立一個struct存放選擇題的資料
    struct QnA {
        var image: String
        var question: String
        var choice: [String]
        var answer: Int
    }

    //建立一個array存放題目數量
    var number = [0,1,2,3,4,5,6,7,8,9]
    //題數
    var questionCount = 0
    //分數
    var score = 0
    //正確答案
    var rightAnswer = 0
    
    var questionData = [QnA(image: "1.jpg", question: "牛仔褲的「小口袋」是用來放什麼東西？",
                            choice: ["零錢", "懷錶", "香菸", "糖果"], answer: 2),
                        QnA(image: "2.jpg", question: "為什麼鳥類在外太空會餓死？",
                            choice: ["吃不下", "沒有食物吃", "沒有地心引力", "要問鳥類們"], answer: 3),
                        QnA(image: "3.jpg", question: "一支鉛筆平均可以畫出多長的線？",
                            choice: ["53.6公里", "63.5公尺", "356公分", "6530釐米"], answer: 1),
                        QnA(image: "4.jpg", question: "人類被自動販賣機砸死的機率「？」被大白鯊咬死的機率。",
                            choice: [">", "<", "=", "不知道"], answer: 1),
                        QnA(image: "5.jpg", question: "人類長大後，骨頭會從305塊變成幾塊？",
                            choice: ["404", "305", "407", "206"], answer: 4),
                        QnA(image: "6.jpg", question: "南極冰河裡，其中3%水分來自哪裡？",
                            choice: ["鯨魚的眼淚", "企鵝的尿", "北極熊的口水", "鱷魚的汗"], answer: 2),
                        QnA(image: "7.jpg", question: "鱷魚沒辦法吃冰淇淋、喇舌、吹長笛，是什麼原因？",
                            choice: ["不喜歡", "舌頭不伸出嘴巴", "舌頭不能動", "沒有舌頭"], answer: 2),
                        QnA(image: "8.jpg", question: "長頸鹿可以用舌頭清耳屎，請問舌頭有多長？",
                            choice: ["53公分", "67公分", "49公分", "75公分"], answer: 1),
                        QnA(image: "9.jpg", question: "太空人為什麼不吃豆類？",
                            choice: ["無法製成太空食物", "太空人不喜歡吃", "會一直放屁", "要問太空人"], answer: 3),
                        QnA(image: "10.jpg", question: "英國有一對相差「？」天才出生的雙胞胎。",
                            choice: ["66", "25", "3", "87"], answer: 4)]
    
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet var questionChoice: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scoreLabel.text = "目前 \(String(score)) 分"
        showQuestion()
    }

    @IBAction func choicePressed(_ sender: UIButton) {
        
        if sender.tag == rightAnswer {
            score = score + 10
            scoreLabel.text = "目前 \(String(score)) 分"
        }
        
        if questionCount == 10 {
            alert()
        }
            
        else {
            showQuestion()
        }
        
    }
    
    @IBAction func restartPressed(_ sender: Any) {
        
        initialize()
        showQuestion()
        
    }
    
    func showQuestion() {
        
        questionCount = questionCount + 1
        
        let randomNumber = Int(arc4random_uniform(UInt32(number.count)))
        let value = number[randomNumber]
        
        questionImage.image = UIImage(named: questionData[value].image)
        questionNumber.text = "第 \(questionCount) 題"
        questionText.text = questionData[value].question
        rightAnswer = questionData[value].answer
        
        var choiceIndex = 0
        for i in 0..<questionChoice.count {
            questionChoice[i].setTitle(questionData[value].choice[choiceIndex], for: .normal)
            choiceIndex = choiceIndex + 1
        }
        
        number.remove(at: randomNumber)
        
    }
    
    func initialize() {
        
        number = [0,1,2,3,4,5,6,7,8,9]
        questionCount = 0
        score = 0
        scoreLabel.text = "目前 \(String(score)) 分"
    
    }
    
    func alert() {

        let alertController = UIAlertController(
            title: "測驗結束", message: "得 \(score) 分", preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "確認", style: .default,
            handler:{
                (action: UIAlertAction!) -> Void in
        })
        alertController.addAction(okAction)
    
        self.present(alertController, animated: true, completion: nil)
    }
    
}

