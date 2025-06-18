//
//  DetailViewController.swift
//  StormViewer
//
//  Created by jatin foujdar on 13/06/25.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
        
        if let imageToload = selectedImage {
            ImageView.image = UIImage(named: imageToload)
        }
    }
    
    @objc func shareTapped() {
    
        guard let image = ImageView.image?.jpegData(compressionQuality: 0.8)else
        {
            print("no image found ")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
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
