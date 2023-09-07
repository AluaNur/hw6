//
//  ViewController.swift
//  gameHW
//
//  Created by Alua Nurakhanova on 29.08.2023.


import UIKit

class ViewController: UIViewController {
    var arrayImages = ["1","2","3","4","5","6","7","8","1","2","3","4","5","6","7","8"]
    var state = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var winArray : [[Int]] = []
    var count =  0



    override func viewDidLoad() {
        super.viewDidLoad()
        arrayImages.shuffle()
        winArray.removeAll()
        for i in 0..<16{
            for k in 0..<16{
                if arrayImages[i] == arrayImages[k] && i != k {
                    winArray.append([i,k])
                }
            }
        }



    }


    @IBAction func game(_ sender: UIButton) {
      print(winArray)
        if state[sender.tag - 1] != 0 && count == 2{
            return
        }
        count += 1
        print(state)

        var countToReset = 0
        var counter = 0

        state[sender.tag - 1] = 1
        print(state)

        sender.setBackgroundImage(UIImage(named: arrayImages[sender.tag - 1]), for: .normal)

        for i in 0..<16 {
            if state[i] == 1{
                countToReset += 1
            }
            if state[i] == 2{
                counter += 1
            }
        }

        for winState in winArray{
            if state[winState[0]] == 1 && state[winState[1]] == 1{
                state[winState[0]] = 2
                state[winState[1]] = 2
            }
        }
        if countToReset == 2{
            self.clear()
        }
        if counter == 15 {
            let alert = UIAlertController(title: "You Won!", message: "You Won!", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:{
                UIAlertAction in
                self.clearAll()

            }))
            present(alert, animated: true, completion: nil)
        }
    }
    func clear(){
        for i in 0..<16{
            if state[i] == 1{
                let button = view.viewWithTag(i+1) as! UIButton
                button.setBackgroundImage( nil, for: .normal)
                state[i] = 0
                count = 0
            }
        }
    }
    func clearAll(){
        for i in 0..<16{
            let button = view.viewWithTag(i + 1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
            state[i] = 0
        }
    }

}

