//
//  ViewController.swift
//  StrechyTopImage
//
//  Created by Austin Van Alfen on 9/12/18.
//  Copyright © 2018 Austin Van Alfen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var imageView: UIImageView?
    private let maxHeaderHeight: CGFloat = 350
    private let minHeaderHeight: CGFloat = 60
    private let headerHeight: CGFloat = 250
    private let edgeValue: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
    }
    
    func setupTable() {
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: edgeValue, bottom: edgeValue, right: edgeValue)

        let imageView: UIImageView = UIImageView(frame: CGRect.init(x: edgeValue, y: edgeValue, width: view.bounds.width, height: headerHeight))
        imageView.image = #imageLiteral(resourceName: "topImage") // top image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        self.imageView = imageView
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if let imageView = self.imageView {
            let y = headerHeight - (scrollView.contentOffset.y + headerHeight)
            
            let height = min(max(y, minHeaderHeight), maxHeaderHeight)
            
            imageView.frame = CGRect(x: edgeValue, y: edgeValue, width: view.bounds.width, height: height)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
