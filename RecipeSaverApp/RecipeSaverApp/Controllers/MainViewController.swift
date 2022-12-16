//
//  MainViewController.swift
//  RecipeSaverApp
//
//  Created by Иван Доронин on 07.12.2022.
//

import UIKit

final class MainViewController: UIViewController {
    private var buttonsSV = UIStackView()
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var aboutMeText = UITextField()
    private var name = UILabel()
    private var userImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func makeMenuButtons(_ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.setHeight(to: 48)
        return button
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray3
        setupMenuButtons()
        setupTextAboutMe(placeholder: "About me")
        setupName()
        setupImage()
    }
    
    private func setupImage(){
        userImage = UIImageView(image: UIImage(named: "portrait"))
        let screenSize: CGRect = UIScreen.main.bounds
        
        userImage.frame = CGRect(x: 60, y: 150, width: 300, height: screenSize.height * 0.3)
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        self.view.addSubview(userImage)

        //userImage.pin(to: self.view, [.left:24, .right: 24])
    }
    private func setupName(){
        name.text = "JohanaDoe"
        name.layer.cornerRadius = 8.0
        name.setHeight(to: 30)
        name.setWidth(to: self.view.frame.width)
        name.font = UIFont.systemFont(ofSize: 24)
        self.view.addSubview(name)
        name.pinBottom(to: self.view.safeAreaLayoutGuide.topAnchor)
        name.pin(to: self.view, [.left:80, .right: 24, .top: 100])
    }
    
    private func setupTextAboutMe(placeholder title: String) {
        aboutMeText.borderStyle = .roundedRect
        aboutMeText.placeholder = title
        aboutMeText.layer.cornerRadius = 8.0
        aboutMeText.layer.borderWidth = 1.0
        // aboutMeText.("This person doesn't exist")
        aboutMeText.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        aboutMeText.setHeight(to: 190)
        aboutMeText.setWidth(to: self.view.frame.width)
        self.view.addSubview(aboutMeText)
        aboutMeText.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
        aboutMeText.pin(to: self.view, [.left:24, .right: 24, .bottom: 150])
    }
    
    private func setupMenuButtons() {
        // Add icons for each button.
        let homeRecipeButton = makeMenuButtons("home")
        homeRecipeButton.addTarget(self, action: #selector(homeRecipeButtonPressed), for: .touchUpInside)
        
        let categoryRecipeButton  = makeMenuButtons("cat")
        categoryRecipeButton.addTarget(self, action: #selector(categoryRecipeButtonPressed), for: .touchUpInside)
        
        let createNewRecipeButton = makeMenuButtons("new")
        createNewRecipeButton.addTarget(self, action: #selector(createNewRecipeButtonPressed), for: .touchUpInside)
        
        let favoritesRecipesButton = makeMenuButtons("fav")
        favoritesRecipesButton.addTarget(self, action: #selector(favoritesRecipesButtonPressed), for: .touchUpInside)
        
        let settingsButton = makeMenuButtons("set")
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        
        buttonsSV = UIStackView(arrangedSubviews: [homeRecipeButton, categoryRecipeButton, createNewRecipeButton, favoritesRecipesButton, settingsButton])
        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        self.view.addSubview(buttonsSV)
        buttonsSV.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
        buttonsSV.pin(to: self.view, [.left:24, .right:24, .bottom: 30])
        // Add code for autoLayot buttonSV
    }
    
    @objc
    private func homeRecipeButtonPressed() {
        let newsListController = HomeRecipeButtonController()
        navigationController?.pushViewController(newsListController, animated: true)
    }
    
    @objc
    private func categoryRecipeButtonPressed() {
        
    }
    
    @objc
    private func createNewRecipeButtonPressed() {
        
    }
    
    @objc
    private func favoritesRecipesButtonPressed() {
        let rec = RecipeController()
        navigationController?.pushViewController(rec, animated: true)
    }
    
    @objc
    private func settingsButtonPressed() {
        
    }
}
