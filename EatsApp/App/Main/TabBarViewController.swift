//
//  TabBarViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 16/12/20.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    // Show the Navigation Bar
    navigationController?.setNavigationBarHidden(true, animated: true)

    }

    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    // Hide the Navigation Bar
    navigationController?.setNavigationBarHidden(false, animated: false)
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
