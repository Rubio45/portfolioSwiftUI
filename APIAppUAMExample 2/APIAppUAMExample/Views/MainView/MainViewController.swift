//
//  MainViewController.swift
//  APIAppUAMExample
//
//  Created by Macbook on 3/10/24.
//

import UIKit

enum Section  {
    case main
}

class MainViewController: UIViewController {
    
    typealias DataSource = UITableViewDiffableDataSource<Section, ProductModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ProductModel>
    
    private let mainController = MainController()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search products"
        searchController.searchResultsUpdater = self
        
        return searchController
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    private var products = [ProductModel]()
    
    private lazy var dataSource: DataSource = {
        let dataSource = DataSource(tableView: tableView) { [weak self] tableView, indexPath, productModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell
            cell?.titleProductLabel.text = productModel.title
            cell?.priceProductLabel.text = "$\(productModel.price)"
            
            Task {
                cell?.imageProductView.image = await self?.mainController.loadImage(url: productModel.thumbnail)
            }
            
            return cell
        }
        
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        
        searchControllerConfiguration()
        registerCell()
        configureTableView()
        configureNavigationBar()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func configureNavigationBar() {
        navigationItem.hidesBackButton = true
        configureButtons()
    }
    
    private func configureTableView() {
        tableView.delegate = self
    }
    
    private func loadData() {
        Task {
            products = await mainController.getProducts() ?? []
            applySnapshot()
        }
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    private func configureButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(popMainView))
    }
    
    @objc func addProduct() {
        performSegue(withIdentifier: "goToAddProduct", sender: self)
    }
    
    private func searchControllerConfiguration() {
        navigationItem.searchController = searchController
    }
    
    func applySnapshot() {
        var snapshot = Snapshot()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc private func popMainView() {
        mainController.deleteToken()
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UISearchResultsUpdating

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        
        Task {
            products = await mainController.getProducts(query: query) ?? []
            applySnapshot()
        }
    }
}
// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Task {
            let productExample = await mainController.getProduct(id: products[indexPath.row].id ?? 1)
            print(productExample ?? "No hay producto")
            let destVC = ProductDetailViewController(product: productExample, controller: mainController)
            navigationController?.pushViewController(destVC, animated: true)
        }
    }
}
