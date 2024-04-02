//
//  ToastView.swift
//  Maps
//
//  Created by Daniel Moya on 2/4/24.
//

import UIKit

class ToastView: UILabel {
    static let shared = ToastView()

    private init() {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.textColor = UIColor.white
        self.textAlignment = .center
        self.numberOfLines = 0
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.alpha = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showToast(message: String, duration: TimeInterval = 2.0) {
        self.text = message
        
        guard let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        
        keyWindow.addSubview(self)
        
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: keyWindow.centerXAnchor),
            self.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            self.bottomAnchor.constraint(equalTo: keyWindow.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: duration, options: [], animations: {
                self.alpha = 0
            }, completion: { _ in
                self.removeFromSuperview()
            })
        }
    }
}
