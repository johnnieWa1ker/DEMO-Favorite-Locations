//
//  DetailPlaceViewController.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 06.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol DetailPlaceViewInput: ViperViewInput { }

protocol DetailPlaceViewOutput: ViperViewOutput { }

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
    @IBOutlet private weak var addButton: UIButton!
    
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
        
        self.coverImageView.image = AppAssets.addImagePlaceholder
        self.coverImageView.contentMode = .scaleAspectFit
        
        self.titleLabel.text = AppLocalization.Detail.titleLabel.loc
        self.descriptionLabel.text = AppLocalization.Detail.descriptionLabel.loc
        self.typeLabel.text = AppLocalization.Detail.typeLabel.loc
        
        self.titleTextField.placeholder = AppLocalization.Detail.titlePH.loc
        self.descriptionTextField.placeholder = AppLocalization.Detail.descriptionPH.loc
        self.typeTextField.placeholder = AppLocalization.Detail.typePH.loc
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.asBackground())
        self.coverBackgroundView.apply(.forContent())
        
        self.addButton.apply(.circle(image: AppAssets.photoAdd, imageColor: AppTheme.white))
        
        self.titleLabel.apply(.sfHeadlineRegular16(AppTheme.white, .left))
        self.descriptionLabel.apply(.sfHeadlineRegular16(AppTheme.white, .left))
        self.typeLabel.apply(.sfHeadlineRegular16(AppTheme.white, .left))
        
        self.titleTextField.apply(.standart())
        self.descriptionTextField.apply(.standart())
        self.typeTextField.apply(.standart())
    }
    
    // MARK: - DetailPlaceViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension DetailPlaceViewController { }

// MARK: - Module functions
extension DetailPlaceViewController { }
