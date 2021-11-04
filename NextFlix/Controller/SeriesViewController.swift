//
//  SeriesViewController.swift
//  NextFlix
//
//  Created by Thiago Leite on 12/10/21.
//

import UIKit

class SeriesViewController: UIViewController {
    
    @IBOutlet weak var serieTableView: UITableView!
    
    var series: [Serie] =
    [
    .init(imagemSerie: "whatif", titleSerie: "What If", bornIn: "11 de agosto de 2021", description: "Imagina o que teria acontecido aos super-heróis se a história fosse totalmente diferente e se passasse em outra realidade"),
    .init(imagemSerie: "theoffice", titleSerie: "The Office", bornIn: "24 de março de 2005", description: "É uma comédia que gira em torno do cotidiano de um escritório. Esta sátira descreve a vida dos funcionários da fábrica de papel Dunder Miffin, situada em Scranton, na Pensilvânia."),
    .init(imagemSerie: "got", titleSerie: "Game of Thrones", bornIn: "17 de abril de 2011", description: "A  série centra-se no Trono de Ferro dos Sete Reinos e segue um enredo de alianças e conflitos entre as famílias nobres dinásticas, seja competindo para reivindicar o trono ou lutando por sua independência."),
    .init(imagemSerie: "round6", titleSerie: "Round 6", bornIn: "17 de setembro de 2021", description: "Um grupo de 456 pessoas, endividadas e desesperadas, são atraídas para participar de um sangrento jogo de sobrevivência no qual elas têm a chance de sair com o equivalente a US$ 39 milhões - se vencerem uma série de seis desafios."),
    .init(imagemSerie: "ummaluconopedaco", titleSerie: "Um Maluco no Pedaço", bornIn: "10 de setembro de 1990", description: "Conta a história de Will (Will Smith), um jovem de origem humilde que se muda para um luxuoso bairro na Califórnia. Will vive se comportando de maneira inadequada e provocando trapalhadas aos seus tios e primos na mansão. ")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController = segue.destination as? TituloSelecionadoViewController {
                viewController.serie = sender as? Serie
            }
    }
}

extension SeriesViewController: UITableViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicou")
        let serie = series[indexPath.row]
        performSegue(withIdentifier: "SegueDetailIdentifier", sender: serie)
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195
    }

}

extension SeriesViewController: UITableViewDataSource {
    
    private func configTableView() {
        serieTableView.dataSource = self
        serieTableView.delegate = self
        serieTableView.tableFooterView = .init(frame: .zero)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return series.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = serieTableView.dequeueReusableCell(withIdentifier: "seriesTableViewCell", for: indexPath) as? SeriesTableViewCell {
            
            cell.setup(serie: series[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
    

}
