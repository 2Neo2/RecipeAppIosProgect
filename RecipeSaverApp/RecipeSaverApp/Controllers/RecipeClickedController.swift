//
//  RecipeClickedController.swift
//  RecipeSaverApp
//
//  Created by Anton Zaripov on 16.12.2022.
//

import UIKit
final class RecipeClickedController: UIViewController {
    private var descr = UITextView()
    private var name = UILabel()
    private var image1 = UIImageView()
    private var NAME1 = "Duck"
    
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
        name.text = "Утка по-пекински"
        name.textColor = .white
        name.layer.cornerRadius = 8.0
        name.setHeight(to: 30)
        name.setWidth(to: self.view.frame.width)
        name.font = UIFont.systemFont(ofSize: 24)
        self.view.addSubview(name)
        name.pinBottom(to: self.view.safeAreaLayoutGuide.topAnchor)
        name.pin(to: self.view, [.left:105, .right: 24, .top: 100])
    }
    
    private func setupTextView(){
        descr.text = "\n\n\n\n\n\n\n1. Подготовьте утиную тушку к запеканию, как описано выше. \n2. Смешайте маринад из кунжутного масла, меда и соевого соуса. Если нужно, добавьте соль и специи по вкусу.\n3. Натрите тушку маринадом со всех сторон, хорошо промажьте внутри.\n4. Разогрейте духовку до 250 °C.\n5. Пока духовка разогревеатся, налейте в высокую форму для запекания воду примерно на 2–3 см. Сверху положите решетку, смазанную маслом.\n6. На эту конструкцию уложите тушку спиной вниз и поставьте в духовку при 250 °C на 40–45 минут.\n7. Теперь переверните утку на грудь, уменьшите температуру до 160 °C и запекайте час.\n8. После этого запекайте птицу на каждом боку при той же температуре по 15–20 минут.\n9. Вытащите утку из духовки и оставьте остывать на 10 минут."
        descr.layer.cornerRadius = 8.0
        descr.layer.borderWidth = 1.0
        // aboutMeText.("This person doesn't exist")
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
