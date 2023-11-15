//
//  ErrorView.swift
//  marvel-app
//
//  Created by Jackson Matheus on 14/11/23.
//


import UIKit


final class ErrorView: UIView {
    
    var errorViewModel: ErrorViewModel {
        didSet {
            titleLabel.text = errorViewModel.title
        }
        
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = errorViewModel.title
        label.font = .cairo(.bold, size: 20)
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = errorViewModel.message
        label.font = .cairo(.bold, size: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .cairo(.regular, size: 17)
        button.setTitle(errorViewModel.buttonName, for: .normal)
        button.backgroundColor = .blue
        //UIColor(hex: "#43BB41ff")
        button.layer.cornerRadius = 15
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews:[titleLabel, messageLabel, button])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.isBaselineRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return stackView
    }()
    
    init(){
        errorViewModel = ErrorViewModel(title: "", message: "", buttonName: "", action: {})
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didTap() {
        errorViewModel.action()
    }
}

extension ErrorView: ViewCode {
    func addConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func addSubviews() {
        self.addSubview(containerStackView)
        
    }
    
    func additionalConfig() {
        self.backgroundColor = .white
    }
    
}
