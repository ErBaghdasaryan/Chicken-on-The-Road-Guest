//
//  HomeViewController.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit
import App007ViewModel
import SnapKit

class HomeViewController: BaseViewController, UICollectionViewDelegate {

    var viewModel: ViewModel?

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let headerImage = UIImageView(image: UIImage(named: "chicken"))
    private let fireImage = UIImageView(image: UIImage(named: "fireIllustration"))
    private let untilButtons = UIView()
    private let spend = UIButton(type: .system)
    private let receive = UIButton(type: .system)
    private var buttonsStack: UIStackView!
    private let promoText = UILabel(text: "Promos",
                                    textColor: .white,
                                    font: UIFont(name: "Knewave-Regular", size: 32))
    private let firsPromo = UIImageView(image: UIImage(named: "promo1"))
    private let secondPromo = UIImageView(image: UIImage(named: "promo2"))
    private let thirdPromo = UIImageView(image: UIImage(named: "promo3"))
    private var promosStack: UIStackView!
    private let menuText = UILabel(text: "Menu",
                                   textColor: .white,
                                   font: UIFont(name: "Knewave-Regular", size: 32))
    var collectionView: UICollectionView!

    let dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        view.alpha = 0
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtonsAction()
    }

    override func setupUI() {
        super.setupUI()

        self.view.backgroundColor = UIColor(hex: "#161824")
        scrollView.contentInsetAdjustmentBehavior = .never
        self.navigationController?.hidesBarsOnSwipe = false

        self.untilButtons.backgroundColor = UIColor(hex: "#3A3D51")
        self.untilButtons.layer.masksToBounds = true
        self.untilButtons.layer.cornerRadius = 30
        self.untilButtons.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]

        self.spend.setTitle("Spend C", for: .normal)
        self.spend.setTitleColor(.black, for: .normal)
        self.spend.titleLabel?.font = UIFont(name: "Knewave-Regular", size: 24)
        self.spend.backgroundColor = UIColor(hex: "#FFC21A")
        self.spend.layer.masksToBounds = true
        self.spend.layer.cornerRadius = 30

        self.receive.setTitle("Receive C", for: .normal)
        self.receive.setTitleColor(.white, for: .normal)
        self.receive.titleLabel?.font = UIFont(name: "Knewave-Regular", size: 24)
        self.receive.backgroundColor = UIColor(hex: "#3DC55B")
        self.receive.layer.masksToBounds = true
        self.receive.layer.cornerRadius = 30

        self.buttonsStack = UIStackView(arrangedSubviews: [self.spend, self.receive],
                                        axis: .horizontal,
                                        spacing: 12)
        self.buttonsStack.distribution = .fillEqually

        self.promoText.textAlignment = .left
        self.menuText.textAlignment = .left

        self.promosStack = UIStackView(arrangedSubviews: [firsPromo,
                                                          secondPromo,
                                                          thirdPromo],
                                       axis: .vertical,
                                       spacing: 8)
        self.promosStack.distribution = .fillEqually

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 93, height: 122)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear

        collectionView.register(MenuCell.self)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true

        collectionView.delegate = self
        collectionView.dataSource = self

        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        self.contentView.addSubview(headerImage)
        self.contentView.addSubview(untilButtons)
        self.contentView.addSubview(fireImage)
        self.contentView.addSubview(buttonsStack)
        self.contentView.addSubview(promoText)
        self.contentView.addSubview(promosStack)
        self.contentView.addSubview(menuText)
        self.contentView.addSubview(collectionView)
        self.view.addSubview(dimmingView)
        setupConstraints()
        setupNavigationItems()
    }

    override func setupViewModel() {
        super.setupViewModel()
        viewModel?.loadMenuItems()
        self.collectionView.reloadData()
    }

    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        headerImage.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(140)
            view.centerX.equalToSuperview()
            view.height.equalTo(252)
            view.width.equalTo(233)
        }

        fireImage.snp.makeConstraints { view in
            view.top.equalTo(headerImage.snp.bottom)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(142)
        }

        untilButtons.snp.makeConstraints { view in
            view.top.equalTo(headerImage.snp.bottom).offset(111)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(156)
        }

        buttonsStack.snp.makeConstraints { view in
            view.top.equalTo(untilButtons.snp.top).offset(24)
            view.leading.equalTo(untilButtons.snp.leading).offset(12)
            view.trailing.equalTo(untilButtons.snp.trailing).inset(12)
            view.bottom.equalTo(untilButtons.snp.bottom).inset(24)
        }

        promoText.snp.makeConstraints { view in
            view.top.equalTo(buttonsStack.snp.bottom).offset(50)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(30)
        }

        promosStack.snp.makeConstraints { view in
            view.top.equalTo(promoText.snp.bottom).offset(24)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(214)
        }

        menuText.snp.makeConstraints { view in
            view.top.equalTo(promosStack.snp.bottom).offset(40)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(30)
        }

        collectionView.snp.makeConstraints { view in
            view.top.equalTo(menuText.snp.bottom).offset(20)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview()
            view.height.equalTo(184)
            view.bottom.equalToSuperview().inset(20)
        }

        dimmingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

//MARK: Make buttons actions
extension HomeViewController {
    
    private func makeButtonsAction() {
        spend.addTarget(self, action: #selector(openSpend), for: .touchUpInside)
        receive.addTarget(self, action: #selector(openReceive), for: .touchUpInside)
    }

    @objc func openSpend() {
        guard let navigationController = self.navigationController else { return }
        HomeRouter.showSpendViewController(in: navigationController)
    }

    @objc func openReceive() {
        guard let navigationController = self.navigationController else { return }
        HomeRouter.showReceiveViewController(in: navigationController)
    }

    private func setupNavigationItems() {

        let addButton = UIButton(type: .system)
        addButton.setImage(UIImage(named: "settings"), for: .normal)
        addButton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: addButton)
        navigationItem.rightBarButtonItem = barButton
        self.navigationController?.navigationBar.tintColor = .white

        let leftImageView = UIImageView(image: UIImage(named: "leftHeader"))
        leftImageView.contentMode = .scaleAspectFit

        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 24))
        leftImageView.frame = containerView.bounds
        containerView.addSubview(leftImageView)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: containerView)
        self.navigationController?.navigationBar.backgroundColor = UIColor(hex: "#161824")
    }

    @objc func openSettings() {
        guard let navigationController = self.navigationController else { return }
        HomeRouter.showSettingsViewController(in: navigationController)
    }
}

extension HomeViewController: IViewModelableController {
    typealias ViewModel = IHomeViewModel
}

//MARK: CollectionView delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.menuItems.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MenuCell = collectionView.dequeueReusableCell(for: indexPath)

        cell.setup(image: viewModel?.menuItems[indexPath.row].image ?? "")
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20
        cell.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 184, height: 184)
    }
}

//MARK: Preview
import SwiftUI

struct HomeViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let homeViewController = HomeViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<HomeViewControllerProvider.ContainerView>) -> HomeViewController {
            return homeViewController
        }

        func updateUIViewController(_ uiViewController: HomeViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeViewControllerProvider.ContainerView>) {
        }
    }
}
