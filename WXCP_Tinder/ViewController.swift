//
//  ViewController.swift
//  WXCP_Tinder
//
//  Created by Will Xu  on 10/25/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    
    var fadeTransition: FadeTransition!
    
    private func gestureRecognizer(_ gestureRecognizer: UIPanGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UITapGestureRecognizer) -> Bool {
        return true
    }
    
    var origCen: CGPoint!
    var touchPosition: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.origCen = cardView.center
        picView.image = UIImage(named: "ryan")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            self.touchPosition = position
        }
    }

    @IBAction func imagePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var multiply = 1.00
        if sender.state == .began {
            
        } else if sender.state == .changed {
            self.cardView.center = CGPoint(x: origCen.x + translation.x, y: origCen.y)
            
            if (touchPosition.y > self.cardView.center.y) {
                multiply = -1.00
            }
            
            self.cardView.transform = self.cardView.transform.rotated(by: CGFloat(Double(translation.x)/385 * multiply * Double.pi / 180))
            
        } else if sender.state == .ended {
            if (abs(self.cardView.center.x - self.origCen.x) < 50) {
                self.cardView.transform = CGAffineTransform.identity
                self.cardView.center = self.origCen
            } else if (translation.x > 50) {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.cardView.transform = CGAffineTransform(translationX: CGFloat(500), y: CGFloat(0.00))
                }, completion: nil)
            } else if (translation.x < -50) {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.cardView.transform = CGAffineTransform(translationX: CGFloat(-500), y: CGFloat(0.00))
                }, completion: nil)
            }
        }
    }
    
    @IBAction func tapped(_ sender: Any) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DetailViewController {
            dest.image = UIImage(named: "ryan")
            self.fadeTransition = FadeTransition()
            self.fadeTransition.duration = 1.0
            dest.transitioningDelegate = self.fadeTransition
            
        }
    }
    
}

