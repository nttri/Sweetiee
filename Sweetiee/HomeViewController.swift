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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pulse = PulseAnimation(numberOfPulse: Float.infinity, radius: screenWidth*0.3, postion: circleView.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        view.layer.insertSublayer(pulse, below: circleView.layer)
        
        let pulse2 = PulseAnimation(numberOfPulse: Float.infinity, radius: screenWidth*0.4, postion: circleView.center)
        pulse2.animationDuration = 1.5
        pulse2.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        view.layer.insertSublayer(pulse2, below: circleView.layer)
        
        let pulse3 = PulseAnimation(numberOfPulse: Float.infinity, radius: screenWidth*0.5, postion: circleView.center)
        pulse3.animationDuration = 2.0
        pulse3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.insertSublayer(pulse3, below: circleView.layer)
    }
    
    private func setupUI() {
        setupBackgroundVideo()
        setupLightViewEffect()
        setupCoupleInfo()
        setupPersonalInfo()
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
        let boyImgView = UIImageView(image: boyImg)
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
        
        let boyAgeLbl = UILabel()
        let boyBirthday = Date.from(year: 1997, month: 2, day: 3)
        boyAgeLbl.text = "\(calculateAge(from: boyBirthday))"
        boyAgeLbl.font = .rounded(ofSize: 18, weight: .semibold)
        boyAgeLbl.textColor = .systemBlue
        boyAgeLbl.addTextOutline(usingColor: .white, outlineWidth: 6)
        boyView.addSubview(boyAgeLbl)
        boyAgeLbl.translatesAutoresizingMaskIntoConstraints = false
        boyAgeLbl.topAnchor.constraint(equalTo: boyNameLbl.bottomAnchor, constant: 6).isActive = true
        boyAgeLbl.centerXAnchor.constraint(equalTo: boyImgView.centerXAnchor).isActive = true
        
        //girl
        let girlView = UIView()
        view.addSubview(girlView)
        girlView.translatesAutoresizingMaskIntoConstraints = false
        girlView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        girlView.leadingAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        girlView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        girlView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        let girlImg = UIImage(named: "her.jpg")
        let girlImgView = UIImageView(image: girlImg)
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
        
        let girlAgeLbl = UILabel()
        let girlBirthday = Date.from(year: 1998, month: 1, day: 17)
        girlAgeLbl.text = "\(calculateAge(from: girlBirthday))"
        girlAgeLbl.font = .rounded(ofSize: 18, weight: .semibold)
        girlAgeLbl.textColor = .systemPink
        girlAgeLbl.addTextOutline(usingColor: .white, outlineWidth: 6)
        girlView.addSubview(girlAgeLbl)
        girlAgeLbl.translatesAutoresizingMaskIntoConstraints = false
        girlAgeLbl.topAnchor.constraint(equalTo: girlNameLbl.bottomAnchor, constant: 6).isActive = true
        girlAgeLbl.centerXAnchor.constraint(equalTo: girlImgView.centerXAnchor).isActive = true
    }
    
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
    
    private func setupLightViewEffect() {
        let lightView = UIView()
        lightView.frame = view.frame
        lightView.backgroundColor = .white
        lightView.alpha = 0.3
        view.addSubview(lightView)
    }

    //MARK: Video background
    private func setupBackgroundVideo() {
        guard let path = Bundle.main.path(forResource: "background", ofType: ".mp4") else {
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        player.actionAtItemEnd = .none
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.frame
        layer.videoGravity = .resizeAspectFill
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

extension UILabel {
    func addTextOutline(usingColor outlineColor: UIColor, outlineWidth: CGFloat) {
        class OutlinedText: UILabel{
            var outlineWidth: CGFloat = 0
            var outlineColor: UIColor = .clear

            override public func drawText(in rect: CGRect) {
                let shadowOffset = self.shadowOffset
                let textColor = self.textColor

                let c = UIGraphicsGetCurrentContext()
                c?.setLineWidth(outlineWidth)
                c?.setLineJoin(.round)
                c?.setTextDrawingMode(.stroke)
                self.textAlignment = .center
                self.textColor = outlineColor
                super.drawText(in:rect)

                c?.setTextDrawingMode(.fill)
                self.textColor = textColor
                self.shadowOffset = CGSize(width: 0, height: 0)
                super.drawText(in:rect)

                self.shadowOffset = shadowOffset
            }
        }

        let textOutline = OutlinedText()
        let outlineTag = 9999

        if let prevTextOutline = viewWithTag(outlineTag) {
            prevTextOutline.removeFromSuperview()
        }

        textOutline.outlineColor = outlineColor
        textOutline.outlineWidth = outlineWidth
        textOutline.textColor = textColor
        textOutline.font = font
        textOutline.text = text
        textOutline.tag = outlineTag

        sizeToFit()
        addSubview(textOutline)
        textOutline.frame = CGRect(x: -(outlineWidth / 2), y: -(outlineWidth / 2),
                                   width: bounds.width + outlineWidth,
                                   height: bounds.height + outlineWidth)
    }
}

extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        let date = calendar.date(from: dateComponents) ?? Date()
        return date
    }
}
