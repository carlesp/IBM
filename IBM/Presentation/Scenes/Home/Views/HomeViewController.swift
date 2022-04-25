//
//  HomeViewController.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import UIKit

class HomeViewController: UIViewController, StoryboardInstantiable {
    
    static var storyboardFileName = "HomeScene"
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: HomeViewModel!
    private var router: HomeRouter!
    
    // MARK: - Lifecycle
    static func create(with viewModel: HomeViewModel,
                       router: HomeRouter) -> HomeViewController {
        let view = HomeViewController.instantiateViewController()
        view.viewModel = viewModel
        view.router = router
        
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        viewModel.getProductsList(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(_):
                strongSelf.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        })
    }
    
    private func setUpUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseIdentifier)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else {
            assertionFailure("Cannot dequeue reusable cell \(ProductCell.self) with reuseIdentifier: \(ProductCell.reuseIdentifier)")
            return UITableViewCell()
        }
        
     
        cell.configure(with: viewModel.productsList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProductCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.productsList[indexPath.row]
        router.goDetailProduct(product: product, rates: viewModel.rates)
    }
}
