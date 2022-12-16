//
//  SecRecipeController.swift
//  RecipeSaverApp
//
//  Created by Anton Zaripov on 16.12.2022.
//

import UIKit
final class SecRecipeController: UIViewController {
    private var descr = UITextView()
    private var name = UILabel()
    private var image1 = UIImageView()
    private var NAME1 = "Churros"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setupTextView()
        setupImage()
        setupTitleLabel()
    }
    
    private func setupTitleLabel(){
        name.text = "Мексиканский чуррос"
        name.textColor = .white
        name.layer.cornerRadius = 8.0
        name.setHeight(to: 30)
        name.setWidth(to: self.view.frame.width)
        name.font = UIFont.systemFont(ofSize: 24)
        self.view.addSubview(name)
        name.pinBottom(to: self.view.safeAreaLayoutGuide.topAnchor)
        name.pin(to: self.view, [.left:90, .right: 24, .top: 100])
    }
    
    private func setupTextView(){
        descr.text = "\n\n\n\n\n\n\n1.Просейте в миску все сыпучие продукты — муку, разрыхлитель, соль и корицу.\n2.Доведите воду до кипения, влейте ее в муку и перемешивайте до однородного состояния. Можно использовать миксер.\n3.Дайте тесту отдохнуть и остыть в течение 5 минут.\n4.Наполните тестом кондитерский мешок с насадкой-звездочкой.\n5.Разогрейте масло и отсадите из кондитерского мешка спираль теста, начиная с центра сковороды.\n6.Как только пончик приобретет золотистый цвет, выложите его на салфетки или бумажные полотенца для впитывания лишнего жира.\n7.Разделите чуррос на палочки и подавайте их с горячим растопленным шоколадом."
        descr.layer.cornerRadius = 8.0
        descr.layer.borderWidth = 1.0
        descr.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        descr.setHeight(to: 400)
        descr.setWidth(to: self.view.frame.width)
        self.view.addSubview(descr)
        descr.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
        descr.pin(to: self.view, [.left:24, .right: 24, .bottom: 150])
    }
    
    private func setupImage(){
        image1 = UIImageView(image: UIImage(named: NAME1))
        image1.layer.cornerRadius = 14.0
        let screenSize: CGRect = UIScreen.main.bounds
        image1.frame = CGRect(x: 50, y: 150, width: 300, height: screenSize.height * 0.3)
        image1.contentMode = .scaleAspectFill
        image1.clipsToBounds = true
        self.view.addSubview(image1)
    }
}
