//
//  ProductDetailViewController.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import UIKit

class ProductDetailViewController: UIViewController, StoryboardInstantiable {
    
    static var storyboardFileName = "ProductScene"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: ProductDetailViewModel!
    private var router: ProductRouter!
    
    var product: Product?
    var rates: [Rate] = []
    
    // MARK: - Lifecycle
    static func create(with viewModel: ProductDetailViewModel,
                       router: ProductRouter) -> ProductDetailViewController {
        let view = ProductDetailViewController.instantiateViewController()
        view.viewModel = viewModel
        view.router = router
        
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.reuseIdentifier)
        
        tableView.reloadData()
        
        guard let product = product else { return }

        titleLabel.text = product.sky
        amountLabel.text = viewModel.getTotalAmount(product: product, rates: rates)
    }
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product?.transactions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let transaction = product?.transactions?[indexPath.row] else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.reuseIdentifier, for: indexPath) as? TransactionCell else {
            assertionFailure("Cannot dequeue reusable cell \(TransactionCell.self) with reuseIdentifier: \(TransactionCell.reuseIdentifier)")
            return UITableViewCell()
        }
        
        cell.configure(with: transaction)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TransactionCell.height
    }
}
