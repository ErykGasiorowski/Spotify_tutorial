//
//  PlayerControlsView.swift
//  Spotify tutorial
//
//  Created by Eryk Gasiorowski on 18/05/2021.
//

import Foundation
import UIKit

protocol PlayerControlsViewDelegate: AnyObject {
    
    func playerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapForwardButton(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapBackwardsButton(_ playerControlsView: PlayerControlsView)
    func playerControlsView(_ playerControlsView: PlayerControlsView, didSlideVolumeSlider value: Float)
}

struct PlayerControlsViewViewModel {
    let title: String?
    let subtitle: String?
}

final class PlayerControlsView: UIView {
    
    private var isPlaying = true
    
    weak var delegate: PlayerControlsViewDelegate?
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        
        return slider
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hapsialka"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Słucha po kryjomu Nocnego Kochanka"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let backwardButton: UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "backward.end.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        
       return button
    }()
    
    private let forwardButton: UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "forward.end.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        
       return button
    }()
    
    private let playPauseButton: UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "pause.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .regular))
        button.setImage(image, for: .normal)
        
       return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        // Labels
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        
        // Sliders
        addSubview(volumeSlider)
        volumeSlider.addTarget(self, action: #selector(didSlideVolumeSlider), for: .touchUpInside)
        
        // Buttons
        addSubview(backwardButton)
        addSubview(forwardButton)
        addSubview(playPauseButton)

        backwardButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        forwardButton.addTarget(self, action: #selector(didTapForward), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didSlideVolumeSlider(_ slider: UISlider) {
        let value = slider.value
        delegate?.playerControlsView(self, didSlideVolumeSlider: value)
    }
    
    @objc private func didTapBack() {
        delegate?.playerControlsViewDidTapBackwardsButton(self)
        
    }
    
    @objc private func didTapForward() {
        delegate?.playerControlsViewDidTapForwardButton(self)
        
    }
    
    @objc private func didTapPlayPause() {
        self.isPlaying = !isPlaying
        delegate?.playerControlsViewDidTapPlayPauseButton(self)
        
        // Update icon
        let play = UIImage(systemName: "play.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .regular))
        let pause = UIImage(systemName: "pause.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .regular))
        
        playPauseButton.setImage(isPlaying ? pause : play, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        subtitleLabel.frame = CGRect(x: 0, y: nameLabel.bottom+10, width: width, height: 50)
        
        volumeSlider.frame = CGRect(x: 10, y: subtitleLabel.bottom+20, width: width-20, height: 44)
        volumeSlider.tintColor = .label
        
        let buttonSize: CGFloat = 60
        playPauseButton.frame = CGRect(x: (width-buttonSize)/2, y: volumeSlider.bottom+30, width: buttonSize, height: buttonSize)
        backwardButton.frame = CGRect(x: playPauseButton.left-80-buttonSize, y: playPauseButton.top, width: buttonSize, height: buttonSize)
        forwardButton.frame = CGRect(x: playPauseButton.right+80, y: playPauseButton.top, width: buttonSize, height: buttonSize)
    }
    
    func configure(with viewModel: PlayerControlsViewViewModel) {
        
        nameLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
    }
    
}
