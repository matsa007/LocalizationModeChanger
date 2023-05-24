//
//  ViewController.swift
//  LocalizModes
//
//  Created by Сергей Матвеенко on 24.05.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Parameters
    
    private var languages = ["English",
                             "Russian",
                             "German"]
    
    // MARK: - GUI

    private lazy var topLable: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.textAlignment = .center
        return label
    }()
    
    private lazy var logoView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "favicon_berty")
        return logoView
    }()
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    private lazy var lightModeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.tintColor = .white
        return button
    }()
    
    private lazy var darkModeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.tintColor = .white
        return button
    }()
    
    private lazy var systemModeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.tintColor = .white
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviews()
        self.setConstraints()
        self.view.backgroundColor = .green
    }
    
    // MARK: - Constraints
    
    private func addSubviews() {
        self.view.addSubview(self.topLable)
        self.view.addSubview(self.logoView)
        self.view.addSubview(self.pickerView)
        self.view.addSubview(self.lightModeButton)
        self.view.addSubview(self.darkModeButton)
        self.view.addSubview(self.systemModeButton)
    }
    
    private func setConstraints() {
        self.setLabelConstaraints()
        self.setLogoConstaraints()
        self.setPickerViewConstaraints()
        self.setLightModeButtonConstaraints()
        self.setDarkModeButtonConstaraints()
        self.setSystemModeButtonConstaraints()
    }
    
    private func setLabelConstaraints() {
        let label = self.topLable
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
    }
    
    private func setLogoConstaraints() {
        let imageView = self.logoView
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.topLable.snp.centerY).offset(50)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    private func setPickerViewConstaraints() {
        let pickerView = self.pickerView
        pickerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.logoView.snp.centerY).offset(70)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
    
    private func setLightModeButtonConstaraints() {
        let button = self.lightModeButton
//        button.addTarget(self, action: #selector(lightModeButtonTapped), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.top.equalTo(self.pickerView.snp.top).offset(160)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.snp.width).multipliedBy(0.8)
        }
    }
    
    private func setDarkModeButtonConstaraints() {
        let button = self.darkModeButton
//        button.addTarget(self, action: #selector(darkModeButtonTapped), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.top.equalTo(self.lightModeButton.snp.bottom).offset(5)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.lightModeButton)
        }
    }
    
    private func setSystemModeButtonConstaraints() {
        let button = self.systemModeButton
//        button.addTarget(self, action: #selector(systemModeButtonTapped), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.top.equalTo(self.darkModeButton.snp.bottom).offset(5)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.darkModeButton)
        }
    }
    
    


}

