import Foundation

protocol BeerDetailPresenterProtocol: class {
    var viewModel: BeerDetailViewModel { get }
    
    func didReceiveEvent(_ event: BeerDetailEvent)
    func didTriggerAction(_ action: BeerDetailAction)
}

final class BeerDetailPresenter: NSObject {
    private let dependencies: BeerDetailPresenterDependenciesProtocol
    private let interactor: BeerDetailInteractorProtocol
    
    private(set) var viewModel: BeerDetailViewModel
    
    init(dependencies: BeerDetailPresenterDependenciesProtocol,
         interactor: BeerDetailInteractorProtocol) {
        self.dependencies = dependencies
        self.interactor = interactor
        
        viewModel = BeerDetailViewModel()
    }
}

extension BeerDetailPresenter: BeerDetailPresenterProtocol {
    func didReceiveEvent(_ event: BeerDetailEvent) {
        switch event {
            case .viewAppears:
                debugPrint("viewAppears")
        }
    }

    func didTriggerAction(_ action: BeerDetailAction) {

    }
}
