//
//  PreloadingViewController.swift
//  Leadsdoit
//
//  Created by Даниил Махно on 18.06.2022.
//

import UIKit

class PreloadingViewController: UIViewController {
    
    @IBOutlet weak var centralLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuringUI()
        setProgressView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)

    }
    
   private func configuringUI() {
        
        let myMutableString = NSMutableAttributedString(string: "Test App Design")
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.392, green: 0.863, blue: 0.812, alpha: 1), range: NSRange(location: 0,length: 4))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location: 5,length: 10))
        
        centralLabel.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        centralLabel.attributedText = myMutableString
        
        
    }
    
    private func setProgressView(){
        
        progressView.setProgress(0, animated: true)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
    }
    
    @objc func updateProgressView() {
        
        if progressView.progress != 1 {
            
            self.progressView.progress += 1/5
            
        } else {
            
            if let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
                mainViewController.modalTransitionStyle = .crossDissolve
                mainViewController.modalPresentationStyle = .overCurrentContext
                
                self.present(mainViewController, animated: true)
            }
        }
    }
}
