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
    
    private let defaults = UserDefaults()
    private var languages = ["English",
                             "Russian",
                             "German"]
    
    private var pickerRow: Int {
        set {
            defaults.set(newValue, forKey: "row")
        }
        
        get {
            defaults.object(forKey: "row") as? Int ?? 0
        }
    }
    
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
        self.checkPikersPosition(row: self.pickerRow)
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerView.selectRow(self.pickerRow, inComponent: 0, animated: false)
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
    
    // MARK: - Localization
    
    private func checkPikersPosition(row: Int) {
        switch row {
        case 0:
            self.changeLabelLang(lang: "en")
            self.changePickerLang(lang: "en")
            self.changeButtonsLang(lang: "en")
        case 1:
            self.changeLabelLang(lang: "ru")
            self.changePickerLang(lang: "ru")
            self.changeButtonsLang(lang: "ru")
        case 2:
            self.changeLabelLang(lang: "de")
            self.changePickerLang(lang: "de")
            self.changeButtonsLang(lang: "de")
        default:
            break
        }
    }
    
    private func changeLabelLang(lang: String) {
        self.topLable.text = "welcome_message".localizeString(string: lang)
    }
    
    private func changePickerLang(lang: String) {
        self.languages = ["en_language".localizeString(string: lang), "ru_language".localizeString(string: lang), "de_language".localizeString(string: lang)]
        DispatchQueue.main.async {
            self.pickerView.reloadAllComponents()
        }
    }
    
    private func changeButtonsLang(lang: String) {
        self.lightModeButton.setTitle("light_button".localizeString(string: lang), for: .normal)
        self.darkModeButton.setTitle("dark_button".localizeString(string: lang), for: .normal)
        self.systemModeButton.setTitle("system_button".localizeString(string: lang), for: .normal)
    }
}

// MARK: - Extensions

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.languages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerRow = row
        self.checkPikersPosition(row: row)
    }
}
