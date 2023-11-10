//
//  WorksView.swift
//  artExploreApp
//
//  Created by Nikita Savchik on 10/11/2023.
//

import UIKit
import SnapKit

class WorksView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Author's works"
        label.font = .rounded(ofSize: 40, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
