//
//  MapViewController.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import MapKit

protocol MapViewInput: ViperViewInput { }

protocol MapViewOutput: ViperViewOutput { }

class MapViewController: ViperViewController, MapViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Props
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate var output: MapViewOutput? {
        guard let output = self._output as? MapViewOutput else { return nil }
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
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - MapViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension MapViewController { }

// MARK: - Module functions
extension MapViewController { }
