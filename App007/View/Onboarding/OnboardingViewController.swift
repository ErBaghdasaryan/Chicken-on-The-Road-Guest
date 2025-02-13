//
//  OnboardingViewController.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit
import App007ViewModel
import SnapKit

class OnboardingViewController: BaseViewController, UICollectionViewDelegate {

    var viewModel: ViewModel?

    private let headerImage = UIImageView(image: UIImage(named: "flatLogo"))
    var collectionView: UICollectionView!
    private let pageControl = AdvancedPageControlView()
    private let afterNextImage = UIImageView(image: UIImage(named: "fireIllustration"))
    private let nextButton = UIButton(type: .system)
    private var currentIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtonsAction()
    }

    override func setupUI() {
        super.setupUI()

        self.view.backgroundColor = UIColor(hex: "#161824")

        self.nextButton.setTitle("Next!", for: .normal)
        self.nextButton.setTitleColor(.black, for: .normal)
        self.nextButton.titleLabel?.font = UIFont(name: "Knewave-Regular", size: 24)
        self.nextButton.backgroundColor = UIColor(hex: "#FFC21A")
        self.nextButton.layer.masksToBounds = true
        self.nextButton.layer.cornerRadius = 30

        let mylayout = UICollectionViewFlowLayout()
        mylayout.itemSize = sizeForItem()
        mylayout.scrollDirection = .horizontal
        mylayout.minimumLineSpacing = 0
        mylayout.minimumInteritemSpacing = 0

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: mylayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear

        collectionView.register(OnboardingCell.self)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false

        pageControl.drawer = ExtendedDotDrawer(numberOfPages: 2,
                                               height: 8,
                                               width: 8,
                                               space: 8,
                                               indicatorColor: UIColor(hex: "#FFC21A"),
                                               dotsColor: UIColor.white,
                                               isBordered: true,
                                               borderWidth: 0.0,
                                               indicatorBorderColor: .orange,
                                               indicatorBorderWidth: 0.0)
        pageControl.setPage(0)

        self.view.addSubview(headerImage)
        self.view.addSubview(pageControl)
        self.view.addSubview(collectionView)
        self.view.addSubview(nextButton)
        self.view.addSubview(afterNextImage)
        setupConstraints()
    }

    override func setupViewModel() {
        super.setupViewModel()
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel?.loadData()
    }

    func sizeForItem() -> CGSize {
        let deviceType = UIDevice.currentDeviceType

        switch deviceType {
        case .iPhone:
            let width = self.view.frame.size.width - 32
            let heightt = self.view.frame.size.height - 515
            return CGSize(width: width, height: heightt)
        case .iPad:
            let scaleFactor: CGFloat = 1.5
            let width = 550 * scaleFactor
            let height = 1100 * scaleFactor
            return CGSize(width: width, height: height)
        }
    }

    func setupConstraints() {
        headerImage.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(65)
            view.centerX.equalToSuperview()
            view.height.equalTo(47)
            view.width.equalTo(40)
        }

        pageControl.snp.makeConstraints { view in
            view.top.equalTo(headerImage.snp.bottom).offset(12)
            view.leading.equalToSuperview().offset(176)
            view.trailing.equalToSuperview().inset(176)
            view.height.equalTo(8)
        }

        collectionView.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(205)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.bottom.equalToSuperview().inset(310)
        }

        nextButton.snp.makeConstraints { view in
            view.bottom.equalToSuperview().inset(60)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(108)
        }

        afterNextImage.snp.makeConstraints { view in
            view.bottom.equalToSuperview().inset(137)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(142)
        }
    }

}

//MARK: Make buttons actions
extension OnboardingViewController {
    
    private func makeButtonsAction() {
        nextButton.addTarget(self, action: #selector(nextButtonTaped), for: .touchUpInside)
    }

    @objc func nextButtonTaped() {
        guard let navigationController = self.navigationController else { return }

        let numberOfItems = self.collectionView.numberOfItems(inSection: 0)
        let nextRow = self.currentIndex + 1

        if nextRow < numberOfItems {
            let nextIndexPath = IndexPath(item: nextRow, section: 0)
            self.collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            self.currentIndex = nextRow
            self.pageControl.setPage(1)
        } else {
            OnboardingRouter.showHomeViewController(in: navigationController)
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleItems = collectionView.indexPathsForVisibleItems.sorted()
        if let visibleItem = visibleItems.first {
            currentIndex = visibleItem.item
        }
    }
}

extension OnboardingViewController: IViewModelableController {
    typealias ViewModel = IOnboardingViewModel
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel?.onboardingItems.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnboardingCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setup(image: viewModel?.onboardingItems[indexPath.row].image ?? "")
        self.nextButton.setTitle(viewModel?.onboardingItems[indexPath.row].header ?? "", for: .normal)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return sizeForItem()
    }
}

//MARK: Preview
import SwiftUI

struct OnboardingViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let onboardingViewController = OnboardingViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<OnboardingViewControllerProvider.ContainerView>) -> OnboardingViewController {
            return onboardingViewController
        }

        func updateUIViewController(_ uiViewController: OnboardingViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<OnboardingViewControllerProvider.ContainerView>) {
        }
    }
}
