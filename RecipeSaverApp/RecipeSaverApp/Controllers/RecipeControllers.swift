//
//  RecipeControllers.swift
//  RecipeSaverApp
//
//  Created by Anton Zaripov on 16.12.2022.
//

import UIKit
final class RecipeController: UIViewController {
    private var imageR1 = UIImageView()
    private var image2 = UIImageView()
    private var labelRecipe1 = UILabel()
    private var labelRecipe2 = UILabel()
    private var NAME1 = "Duck"
    private var NAME2 = "Churros"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .systemGray4
        imageR1 = setupImageView(name: NAME1)
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.image1Tapped))
        imageR1.addGestureRecognizer(tapGR)
        imageR1.isUserInteractionEnabled = true
        image2 = setupImageView(name: NAME2)
        let tapGR2 = UITapGestureRecognizer(target: self, action: #selector(self.image2Tapped))
        image2.addGestureRecognizer(tapGR2)
        image2.isUserInteractionEnabled = true
        
        labelRecipe1 = setupLabel(labelText: NAME1)
        labelRecipe2 = setupLabel(labelText: NAME2)
    }
    
    private func setupLabel(labelText: String) -> UILabel {
        let name = UILabel()
        if (labelText == NAME1){
            name.text = "Утка по-пекински"
        } else {
                name.text = "Мексиканский чуррос"
            name.textColor = .white
        }
        name.layer.cornerRadius = 8.0
        name.setHeight(to: 30)
        name.setWidth(to: self.view.frame.width)
        name.font = UIFont.systemFont(ofSize: 24)
        self.view.addSubview(name)
        if (labelText == NAME1){
            name.pinBottom(to: self.view.safeAreaLayoutGuide.topAnchor)
            name.pin(to: self.view, [.left:105, .right: 24, .top: 380])
        } else {
            name.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
            name.pin(to: self.view, [.left:95, .right: 24, .bottom: 100])
        }
        return name
    }
    
    private func setupImageView(name: String) -> UIImageView{
        var image1 = UIImageView()
        image1 = UIImageView(image: UIImage(named: name))
        image1.layer.cornerRadius = 14.0
        let screenSize: CGRect = UIScreen.main.bounds
        if(name == NAME1){
            image1.frame = CGRect(x: 50, y: 150, width: 300, height: screenSize.height * 0.3)
        } else {
            image1.frame = CGRect(x: 50, y: 500, width: 300, height: screenSize.height * 0.3)
        }
        image1.contentMode = .scaleAspectFill
        image1.clipsToBounds = true
        self.view.addSubview(image1)
        return image1
    }
    
    @objc func image1Tapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let rec = RecipeClickedController()
            navigationController?.pushViewController(rec, animated: true)
        }
    }
    
    @objc func image2Tapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let rec = SecRecipeController()
            navigationController?.pushViewController(rec, animated: true)
        }
    }
}

