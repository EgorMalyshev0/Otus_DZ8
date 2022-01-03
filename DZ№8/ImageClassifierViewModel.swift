//
//  ImageClassifierViewModel.swift
//  DZ№8
//
//  Created by Egor Malyshev on 03.01.2022.
//

import SwiftUI

final class ImageClassifierViewModel: ObservableObject {
    
    @Published var image: UIImage = .init() {
        didSet {
            classifierService.classifyImage(image)
        }
    }
    @Published var text: String = ""
    
    private lazy var classifierService: ImageClassifierService = {
        let service = ImageClassifierService()
        service.onDidUpdateState = { state in
            switch state {
            case .receiveResult(resultModel: let model):
                self.text = model.description
            case .startRequest:
                self.text = "Processing..."
            case .requestFailed:
                self.text = "Error classigy image"
            }
        }
        return service
    }()
    
}
