//
//  DetailViewController.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 22/08/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let movie: GhibliResponse
    
    init(movie: GhibliResponse) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        title = movie.title
    }

}
