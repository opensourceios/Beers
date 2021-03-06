import AdvancedList
import SwiftUI

protocol BeerListViewProtocol: BeerListProtocol {
    
}

struct BeerListView: View {
    @ObservedObject private var presenter = BeerListWireframe.makePresenter()

    weak var delegate: BeerListDelegateProtocol?
    
    var body: some View {
        NavigationView {
            AdvancedList(presenter.beerViewModels, content: { beerViewModel in
                BeerCell(beer: beerViewModel.beer)
            }, listState: $presenter.listState, emptyStateView: {
                Text("No beers")
            }, errorStateView: { error in
                VStack {
                    Text(error.localizedDescription)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)

                    Button(action: {
                        self.presenter.didTriggerAction(.retry)
                    }) {
                        Text("Retry")
                    }.padding()
                }
            }, loadingStateView: {
                Text("Loading...")
            }, pagination: presenter.pagination)
            .navigationBarTitle(Text("Beers"))
        }
        .onAppear {
            self.presenter.didReceiveEvent(.viewAppears)
        }
        .onDisappear {
            self.presenter.didReceiveEvent(.viewDisappears)
        }
    }
}

extension BeerListView: BeerListViewProtocol {
    
}

extension BeerListView: BeerListProtocol {
    
}

extension BeerListView {
    /*private func onMove(from indexSet: IndexSet, to: Int) {
        indexSet.forEach { index in
            let beer = presenter.viewModel.beers[index]
            presenter.viewModel.beers.remove(at: index)
            presenter.viewModel.beers.insert(beer, at: to)
        }
    }
    
    private func onDelete(at indexSet: IndexSet) {
        indexSet.forEach { index in
            presenter.viewModel.beers.remove(at: index)
        }
    }*/
}

#if DEBUG
struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
#endif
