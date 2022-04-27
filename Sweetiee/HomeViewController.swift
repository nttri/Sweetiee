//
//  HomeViewController.swift
//  Sweetiee
//
//  Created by tringuyen on 19/04/2022.
//

import UIKit
import AVFoundation

fileprivate let screenWidth = UIScreen.main.bounds.width

final class HomeViewController: UIViewController {
    
    private var player: AVPlayer!
    private var circleView: UIView!
    private var boyImgView: UIImageView!
    private var girlImgView: UIImageView!
    private var heartImgView: UIImageView!
    private var kissBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppOrientationUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        setupUI()
        setupAppEvents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPulseAnimation()
    }
    
    
    //MARK: build layout
    private func setupUI() {
        setupBackgroundVideo()
        setupLightViewEffect()
        setupCoupleInfo()
        setupPersonalInfo()
        setupKissButton()
    }
    
    private func setupCoupleInfo() {
        let safeArea = view.safeAreaLayoutGuide
        let roundSize = screenWidth * 0.65
        
        circleView = UIView()
        circleView.layer.cornerRadius = roundSize/2
        view.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        circleView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -130).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: roundSize).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: roundSize).isActive = true
        
        let daysLbl = UILabel()
        let startDay = Date.from(year: 2022, month: 2, day: 14)
        daysLbl.text = "\(calculateDays(from: startDay))"
        daysLbl.font = .rounded(ofSize: 64, weight: .bold)
        daysLbl.textColor = .white
        circleView.addSubview(daysLbl)
        daysLbl.translatesAutoresizingMaskIntoConstraints = false
        daysLbl.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        daysLbl.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        
        let coupleEmojiLbl = UILabel()
        coupleEmojiLbl.text = "👩🏻‍❤️‍👨🏻"
        coupleEmojiLbl.font = .rounded(ofSize: 32, weight: .semibold)
        circleView.addSubview(coupleEmojiLbl)
        coupleEmojiLbl.translatesAutoresizingMaskIntoConstraints = false
        coupleEmojiLbl.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        coupleEmojiLbl.bottomAnchor.constraint(equalTo: daysLbl.topAnchor).isActive = true
        
        let daysTogetherLbl = UILabel()
        daysTogetherLbl.text = "days"
        daysTogetherLbl.font = .rounded(ofSize: 22, weight: .semibold)
        daysTogetherLbl.textColor = .white
        circleView.addSubview(daysTogetherLbl)
        daysTogetherLbl.translatesAutoresizingMaskIntoConstraints = false
        daysTogetherLbl.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        daysTogetherLbl.topAnchor.constraint(equalTo: daysLbl.bottomAnchor).isActive = true
    }
    
    private func setupPersonalInfo() {
        let safeArea = view.safeAreaLayoutGuide
        let avaSize = (screenWidth/2) * 0.65
        
        //boy
        let boyView = UIView()
        view.addSubview(boyView)
        boyView.translatesAutoresizingMaskIntoConstraints = false
        boyView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        boyView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        boyView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        boyView.trailingAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        let boyImg = UIImage(named: "him.jpg")
        boyImgView = UIImageView(image: boyImg)
        boyImgView.layer.cornerRadius = avaSize/2
        boyImgView.clipsToBounds = true
        boyImgView.layer.borderWidth = 6
        boyImgView.layer.borderColor = CGColor(red: 4/255, green: 132/255, blue: 250/255, alpha: 0.7)
        boyView.addSubview(boyImgView)
        boyImgView.translatesAutoresizingMaskIntoConstraints = false
        boyImgView.centerXAnchor.constraint(equalTo: boyView.centerXAnchor).isActive = true
        boyImgView.centerYAnchor.constraint(equalTo: boyView.centerYAnchor, constant: 170).isActive = true
        boyImgView.widthAnchor.constraint(equalToConstant: avaSize).isActive = true
        boyImgView.heightAnchor.constraint(equalToConstant: avaSize).isActive = true
        
        let boyNameLbl = UILabel()
        boyNameLbl.text = "Anh iu"
        boyNameLbl.font = .rounded(ofSize: 22, weight: .bold)
        boyNameLbl.textColor = .systemBlue
        boyNameLbl.addTextOutline(usingColor: .white, outlineWidth: 7)
        boyView.addSubview(boyNameLbl)
        boyNameLbl.translatesAutoresizingMaskIntoConstraints = false
        boyNameLbl.topAnchor.constraint(equalTo: boyImgView.bottomAnchor, constant: 10).isActive = true
        boyNameLbl.centerXAnchor.constraint(equalTo: boyImgView.centerXAnchor).isActive = true
        
        let boyZodiac = UIButton()
        boyZodiac.setTitle("♒️", for: .normal)
        boyZodiac.backgroundColor = .white
        boyZodiac.layer.cornerRadius = 18
        boyView.addSubview(boyZodiac)
        boyZodiac.translatesAutoresizingMaskIntoConstraints = false
        boyZodiac.topAnchor.constraint(equalTo: boyNameLbl.bottomAnchor, constant: 12).isActive = true
        boyZodiac.centerXAnchor.constraint(equalTo: boyView.centerXAnchor).isActive = true
        boyZodiac.widthAnchor.constraint(equalToConstant: 36).isActive = true
        boyZodiac.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //girl
        let girlView = UIView()
        view.addSubview(girlView)
        girlView.translatesAutoresizingMaskIntoConstraints = false
        girlView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        girlView.leadingAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        girlView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        girlView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        let girlImg = UIImage(named: "her.jpg")
        girlImgView = UIImageView(image: girlImg)
        girlImgView.layer.cornerRadius = avaSize/2
        girlImgView.clipsToBounds = true
        girlImgView.layer.borderWidth = 6
        girlImgView.layer.borderColor = CGColor(red: 237/255, green: 0/255, blue: 83/255, alpha: 0.7)
        girlView.addSubview(girlImgView)
        girlImgView.translatesAutoresizingMaskIntoConstraints = false
        girlImgView.centerXAnchor.constraint(equalTo: girlView.centerXAnchor).isActive = true
        girlImgView.centerYAnchor.constraint(equalTo: girlView.centerYAnchor, constant: 170).isActive = true
        girlImgView.widthAnchor.constraint(equalToConstant: avaSize).isActive = true
        girlImgView.heightAnchor.constraint(equalToConstant: avaSize).isActive = true
        
        let girlNameLbl = UILabel()
        girlNameLbl.text = "Bé Ngọt"
        girlNameLbl.font = .rounded(ofSize: 22, weight: .bold)
        girlNameLbl.textColor = .systemPink
        girlNameLbl.addTextOutline(usingColor: .white, outlineWidth: 7)
        girlView.addSubview(girlNameLbl)
        girlNameLbl.translatesAutoresizingMaskIntoConstraints = false
        girlNameLbl.topAnchor.constraint(equalTo: girlImgView.bottomAnchor, constant: 10).isActive = true
        girlNameLbl.centerXAnchor.constraint(equalTo: girlImgView.centerXAnchor).isActive = true
        
        let girlZodiac = UIButton()
        girlZodiac.setTitle("♑️", for: .normal)
        girlZodiac.backgroundColor = .white
        girlZodiac.layer.cornerRadius = 18
        girlView.addSubview(girlZodiac)
        girlZodiac.translatesAutoresizingMaskIntoConstraints = false
        girlZodiac.topAnchor.constraint(equalTo: girlNameLbl.bottomAnchor, constant: 12).isActive = true
        girlZodiac.centerXAnchor.constraint(equalTo: girlView.centerXAnchor).isActive = true
        girlZodiac.widthAnchor.constraint(equalToConstant: 36).isActive = true
        girlZodiac.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //heart image view
        let heartImg = UIImage(systemName: "heart.fill")
        heartImgView = UIImageView(image: heartImg)
        heartImgView.tintColor = .red
        view.addSubview(heartImgView)
        heartImgView.translatesAutoresizingMaskIntoConstraints = false
        heartImgView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        heartImgView.centerYAnchor.constraint(equalTo: boyImgView.centerYAnchor).isActive = true
        heartImgView.frame.size = CGSize(width: 60, height: 60)
    }
    
    private func setupLightViewEffect() {
        let lightView = UIView()
        lightView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        lightView.backgroundColor = .white
        lightView.alpha = 0.3
        view.addSubview(lightView)
    }
    
    private func setupKissButton() {
        let safeArea = view.safeAreaLayoutGuide
        
        kissBtn = UIButton()
        kissBtn.setTitle("💋", for: .normal)
        kissBtn.backgroundColor = .white
        kissBtn.layer.cornerRadius = 15
        kissBtn.addTarget(self, action: #selector(kissBtnTapped), for: .touchUpInside)
        view.addSubview(kissBtn)
        kissBtn.translatesAutoresizingMaskIntoConstraints = false
        kissBtn.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        kissBtn.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -64).isActive = true
        kissBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        kissBtn.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    @objc private func kissBtnTapped() {
        kissBtn.isHidden = true
        startKissAnimation()
    }
    
    
    //MARK: additional calculation
    private func calculateAge(from birthday: Date) -> Int {
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year ?? 0
        return age
    }
    
    private func calculateDays(from birthday: Date) -> Int {
        let now = Date()
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day], from: birthday, to: now)
        let days = dateComponents.day ?? 0
        return days
    }
    
    
    //MARK: Animations management
    private func startPulseAnimation() {
        let pulse = PulseAnimation(numberOfPulse: Float.infinity, radius: screenWidth*0.3, postion: circleView.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        view.layer.insertSublayer(pulse, below: circleView.layer)
        
        let pulse2 = PulseAnimation(numberOfPulse: Float.infinity, radius: screenWidth*0.37, postion: circleView.center)
        pulse2.animationDuration = 1.3
        pulse2.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        view.layer.insertSublayer(pulse2, below: circleView.layer)
        
        let pulse3 = PulseAnimation(numberOfPulse: Float.infinity, radius: screenWidth*0.44, postion: circleView.center)
        pulse3.animationDuration = 1.6
        pulse3.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        view.layer.insertSublayer(pulse3, below: circleView.layer)
        
        let pulse4 = PulseAnimation(numberOfPulse: Float.infinity, radius: screenWidth*0.5, postion: circleView.center)
        pulse4.animationDuration = 1.9
        pulse4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.insertSublayer(pulse4, below: circleView.layer)
    }
    
    private func startKissAnimation() {
        let avaSize = (screenWidth/2) * 0.65
        let moveLen = screenWidth/4 - avaSize/2
        
        //couple come in
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0.3,
                       options: .beginFromCurrentState,
                       animations: {
                            self.boyImgView.center.x += moveLen
                            self.girlImgView.center.x -= moveLen
                       }, completion: { _ in
                           self.heartImgView.isHidden = false
                       })
        
        //heart fly animation
        UIView.animate(withDuration: 3,
                       delay: 2,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0.2,
                       options: .beginFromCurrentState,
                       animations: {
                            self.heartImgView.transform = CGAffineTransform.identity.scaledBy(x: 18, y: 18)
                            self.heartImgView.center.y -= 300
                            self.heartImgView.alpha = 0
                        }, completion: { _ in
                            self.heartImgView.transform = CGAffineTransform.identity
                            self.heartImgView.center.y += 300
                            self.heartImgView.alpha = 1
                            self.kissBtn.isHidden = false
                        })
        
        //couple come out
        UIView.animate(withDuration: 3,
                       delay: 2,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 10,
                       options: .beginFromCurrentState,
                       animations: {
                            self.boyImgView.center.x -= moveLen
                            self.girlImgView.center.x += moveLen
                       }, completion: {_ in
                           self.kissBtn.isHidden = false
                       })
    }

    
    //MARK: Video background
    private func setupBackgroundVideo() {
        guard let path = Bundle.main.path(forResource: "background", ofType: ".mp4") else {
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        player.actionAtItemEnd = .none
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        layer.videoGravity = .resizeAspectFill
        view.layer.insertSublayer(layer, at: 0)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerDidReachEnd),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
        player.seek(to: .zero)
        player.play()
    }
    
    @objc private func playerDidReachEnd() {
        player.seek(to: .zero)
    }
    
    
    //MARK: App events
    private func setupAppEvents() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playPlayer),
                                               name: UIScene.willEnterForegroundNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(pausePlayer),
                                               name: UIScene.didEnterBackgroundNotification,
                                               object: nil)
    }
    
    @objc func pausePlayer() {
        player.pause()
    }
        
    @objc func playPlayer() {
        player.play()
    }
}
