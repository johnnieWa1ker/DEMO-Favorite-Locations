//
//  DetailPlaceViewController.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 06.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import CoreGraphics

protocol DetailPlaceViewInput: ViperViewInput {
    func showImageLoadMenu(_ alert: UIAlertController)
    func showImagePickerController(_ source: UIImagePickerController.SourceType)
}

protocol DetailPlaceViewOutput: ViperViewOutput {
    func pressedCancelButton()
    func pressedSaveButton()
    func pressedAddImageButton()
    func editTitle(_ value: String?)
    func editDescription(_ value: String?)
    func editType(_ value: String?)
}

class DetailPlaceViewController: ViperViewController, DetailPlaceViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var coverBackgroundView: UIView!
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var descriptionTextField: UITextField!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var typeTextField: UITextField!
    
    @IBOutlet private weak var addImageButton: UIButton!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    // MARK: - Props
    fileprivate var output: DetailPlaceViewOutput? {
        guard let output = self._output as? DetailPlaceViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.coverImageView.clipsToBounds = true
        
        self.titleLabel.text = AppLocalization.Detail.titleLabel.loc
        self.descriptionLabel.text = AppLocalization.Detail.descriptionLabel.loc
        self.typeLabel.text = AppLocalization.Detail.typeLabel.loc
        
        self.titleTextField.placeholder = AppLocalization.Detail.titlePH.loc
        self.descriptionTextField.placeholder = AppLocalization.Detail.descriptionPH.loc
        self.typeTextField.placeholder = AppLocalization.Detail.typePH.loc
        
        self.saveButton.setTitle(AppLocalization.General.save.loc, for: .normal)
    }
    
    func setupActions() {
        self.cancelButton.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        self.addImageButton.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        
        [
            self.titleTextField,
            self.descriptionTextField,
            self.typeTextField
        ].forEach({ $0?.addTarget(self, action: #selector(self.tfEditing(_:)), for: .editingChanged) })
    }
    
    func applyStyles() {
        self.view.apply(.asBackground())
        self.coverBackgroundView.apply(.forContent())
        
        self.titleLabel.apply(.sfHeadlineRegular16(AppTheme.white, .left))
        self.descriptionLabel.apply(.sfHeadlineRegular16(AppTheme.white, .left))
        self.typeLabel.apply(.sfHeadlineRegular16(AppTheme.white, .left))
        
        self.titleTextField.apply(.standart())
        self.descriptionTextField.apply(.standart())
        self.typeTextField.apply(.standart())
        
        self.addImageButton.apply(.circleColoredWithOnlyImage(AppAssets.iconAddImage, imageColor: AppTheme.white))
        self.saveButton.apply(.accent())
        self.cancelButton.apply(.accentNegativeWithOnlyImage(AppAssets.iconBack))
    }
    
    // MARK: - DetailPlaceViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        guard let viewModel = viewModel as? DetailPlaceViewModel else { return }
        
        if let image = viewModel.currentPlace?.cover {
            self.coverImageView.image = image
            self.coverImageView.contentMode = .scaleAspectFill
            self.makeFadeOnImage()
        } else {
            self.coverImageView.image = AppAssets.addImagePlaceholder
            self.coverImageView.contentMode = .scaleAspectFit
        }
        
        self.titleTextField.text = viewModel.currentPlace?.title
        self.descriptionTextField.text = viewModel.currentPlace?.description
        self.titleTextField.text = viewModel.currentPlace?.title
        
        self.setupComponents()
        self.setupActions()
    }
    
    func showImageLoadMenu(_ alert: UIAlertController) {
        self.present(alert, animated: true)
    }
    
    func showImagePickerController(_ source: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = source
        imagePicker.allowsEditing = true
        imagePicker.modalPresentationStyle = .overFullScreen
        self.present(imagePicker, animated: true)
    }
}

// MARK: - Actions
extension DetailPlaceViewController {
    
    @objc
    func btnAction(_ sender: UIButton) {
        switch sender {
        case self.cancelButton:
            self.output?.pressedCancelButton()
        case self.saveButton:
            self.output?.pressedSaveButton()
        case self.addImageButton:
            self.output?.pressedAddImageButton()
        default:
            break
        }
    }
    
    @objc
    func tfEditing(_ sender: UITextField) {
        switch sender {
        case self.titleTextField:
            self.output?.editTitle(sender.text)
        case self.descriptionTextField:
            self.output?.editDescription(sender.text)
        case typeTextField:
            self.output?.editType(sender.text)
        default:
            break
        }
    }
}

// MARK: - Module functions
extension DetailPlaceViewController {
    
    func makeFadeOnImage() {
        let maskedView = UIView()
        let maskedViewSize = CGSize(width: self.coverImageView.bounds.width,
                                    height: self.coverImageView.bounds.height / 2)
        maskedView.frame = CGRect(x: self.coverImageView.frame.minX,
                                  y: self.coverImageView.frame.maxY - maskedViewSize.height,
                                  width: maskedViewSize.width,
                                  height: maskedViewSize.height)
        maskedView.backgroundColor = AppTheme.black
        
        let gradient = CAGradientLayer()
        gradient.frame = maskedView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1, 0, 0]
        
        maskedView.layer.mask = gradient
        self.coverImageView.addSubview(maskedView)
    }
}

// MARK: - UINavigationControllerDelegate
extension DetailPlaceViewController: UINavigationControllerDelegate { }

// MARK: - UIImagePickerControllerDelegate
extension DetailPlaceViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as? UIImage
        
        if let img = image {
            let imgResize = UIImage.resizeImage(image: img, newHeight: 300)
            self.coverImageView.image = imgResize
            self.coverImageView.contentMode = .scaleAspectFill
        }
        
        dismiss(animated: true, completion: nil)
    }
}
