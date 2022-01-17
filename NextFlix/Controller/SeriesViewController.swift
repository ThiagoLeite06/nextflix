//
//  SeriesViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 12/10/21.
//

import UIKit

class SeriesViewController: UIViewController {
    
    @IBOutlet weak var serieTableView: UITableView!
    
    private let viewModel = SerieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        self.loadData()
        self.serieTableView.reloadData()
//        seriesViewModel.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueDetailIdentifier" {
            if let viewController = segue.destination as? TituloSelecionadoViewController {
                viewController.content = sender as? Serie
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension SeriesViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let serie = viewModel.series[indexPath.row]
        performSegue(withIdentifier: "SegueDetailIdentifier", sender: serie)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195
    }

}

// MARK: - UITableViewDataSource

extension SeriesViewController: UITableViewDataSource {
    
    private func configTableView() {
        serieTableView.dataSource = self
        serieTableView.delegate = self
        serieTableView.tableFooterView = .init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfFavoriteOnTheList()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = serieTableView.dequeueReusableCell(withIdentifier: "seriesTableViewCell", for: indexPath) as? SeriesTableViewCell {
            cell.setup(serie: viewModel.series[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}


extension SeriesViewController: SerieViewModelDelegate {
    func errorAddFavorite() {
        //
    }
    
    func reloadData() {
        //
    }
    
    func loadData() {
        viewModel.service.loadSeries{ items in
            DispatchQueue.main.async {
                self.viewModel.series = items
                self.serieTableView.reloadData()
            }
        }
    }
}
