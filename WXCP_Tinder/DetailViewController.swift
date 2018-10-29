//
//  DetailViewController.swift
//  WXCP_Tinder
//
//  Created by Will Xu  on 10/25/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var picView: UIImageView!
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picView.image = self.image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
