//
//  HomeViewController.swift
//  Sweetiee
//
//  Created by tringuyen on 19/04/2022.
//

import UIKit
import AVFoundation

final class HomeViewController: UIViewController {
    
    private var player: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo()
    }

    //MARK: Video background
    private func playBackgroundVideo() {
        guard let path = Bundle.main.path(forResource: "background", ofType: ".mp4") else {
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        player.actionAtItemEnd = .none
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.frame
        layer.videoGravity = .resizeAspectFill
        layer.opacity = 0.6
        view.layer.insertSublayer(layer, at: 0)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerDidReachEnd),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
        player.seek(to: .zero)
        player.play()
        player.isMuted = true
    }
    
    @objc private func playerDidReachEnd() {
        player.seek(to: .zero)
    }
}
