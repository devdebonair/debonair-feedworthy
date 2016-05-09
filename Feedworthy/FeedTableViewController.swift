//
//  FeedTableViewController.swift
//  PeriscopeFeed
//
//  Created by Vincent Moore on 5/2/16.
//  Copyright © 2016 Vincent Moore. All rights reserved.
//

import UIKit
import Kingfisher
import AVFoundation

class FeedTableViewController: UITableViewController {
    
    let FEED_CELL_IDENTIFIER = "FEED_TABLE_CELL",
        FEED_CELL_IDENTIFIER_PHOTO = "FEED_TABLE_CELL_PHOTO",
        FEED_CELL_IDENTIFIER_VIDEO = "FEED_TABLE_CELL_VIDEO"
    
    let data = [
        FeedPost(username: "debonair", community: "MargotRobbie", time: "4 hrs", media: FeedPost.Media(type: .Image, url: "http://celebmafia.com/wp-content/uploads/2014/06/margot-robbie-photoshoot-for-elle-magazine-australia-march-2014-issue_1.jpg", width: 1280, height: 1660), content: nil),
        
        FeedPost(username: "stationarytransient1", community: "Today I Learned", time: "2 hrs", media: FeedPost.Media(type: .Image, url: "http://cdn2.macworld.co.uk/cmsdata/features/3589633/iphone_6s_review_20.jpg", width: 1600, height: 900), content: "TIL of Planned obsolescence, a manufacturing decision by a company to make consumer products in such a way that they become out-of-date or useless within a known time period so that consumers are forced to buy a product multiple times rather than just once."),
        
        FeedPost(username: "cybrbeast", community: "Futurology", time: "4d", media: FeedPost.Media(type: .Image, url: "http://images.techtimes.com/data/thumbs/full/238222/600/0/0/0/medical-checkup.jpg", width: 600, height: 450), content: "Google Strikes Deal With NHS That Gives AI Unit Access To 1.6 Million Patient Records"),
        
        FeedPost(username: "JCannon", community: "MargotRobbie", time: "4 hrs", media: FeedPost.Media(type: .Image, url: "http://moejackson.com/wp-content/uploads/2014/01/margot_robbie_esquire_me_in_my_place_08.jpg", width: 1200, height: 900), content: "Margot Robbie has admitted that she became so engrossed during her audition for The Wolf Of Wall Street that she actually slapped her eventual co-star, Leonardo DiCaprio, across the face. Like, really hard. However rather than being completely offended by the assault, DiCaprio was hugely impressed, and it eventually led to her being cast in Martin Scorsese’s opus on greed and capitalism."),
        
        FeedPost(username: "sophiepritch5", community: "BlackPeopleTwitter", time: "6 hrs", media: FeedPost.Media(type: .Image, url: "http://i.imgur.com/gZk8NUu.jpg", width: 640, height: 703), content: "She gonna bounce to the next dick, boi."),
        
        FeedPost(username: "hundreddollarman", community: "Anna Kendrick", time: "6 hr", media: FeedPost.Media(type: .Image, url: "http://i.imgur.com/aZXBvyY.jpg", width: 1212, height: 815), content: "Classy in red"),

        FeedPost(username: "debonair", community: "BokuNoHeroAcademia", time: "4 hrs", media: FeedPost.Media(type: .Image, url: "http://images.gogoanime.tv/cover/boku-no-hero-academia.jpg", width: 352, height: 500), content: "BnHA Episode 5"),
        
        FeedPost(username: "arvelljr", community: "SweatyPalms", time: "7 hrs", media: FeedPost.Media(type: .Image, url: "http://i.imgur.com/U37bNEf.jpg", width: 640, height: 480), content: "Whatever is on the other side is not that important"),
        
        FeedPost(username: "debonair", community: "Anna Kendrick", time: "13 hrs", media: FeedPost.Media(type: .Image, url: "http://i.imgur.com/M5HFZXD.jpg", width: 1959, height: 2700), content: "Just Taking a Stroll"),
        
        FeedPost(username: "BHayes", community: "MargotRobbie", time: "4 hrs", media: FeedPost.Media(type: .Image, url: "https://cdn.cloudpix.co/images/margot-robbie/margot-robbie-wallpaper-sexy-7d6e63a4e273578b12f703db9ef0ad46-large-259802.jpg", width: 820, height: 1020), content: "Gorgeous"),
        
        FeedPost(username: "jared", community: "Music", time: "4 hrs", media: FeedPost.Media(type: .Video, url: "http://vevoplaylist-live.hls.adaptive.level3.net/vevo/ch1/appleman.m3u8", width: 1920, height: 1080), content: "Top 10 Music Videos this Week."),
        
        FeedPost(username: "b-man", community: "music", time: "4 hrs", media: FeedPost.Media(type: .Video, url: "http://vevoplaylist-live.hls.adaptive.level3.net/vevo/ch2/appleman.m3u8", width: 1280, height: 720), content: "Trending Songs!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: self.tableView.frame, style: .Grouped)
        tableView.registerClass(FeedTableViewCell.self, forCellReuseIdentifier: FEED_CELL_IDENTIFIER)
        tableView.registerClass(FeedPhotoTableViewCell.self, forCellReuseIdentifier: FEED_CELL_IDENTIFIER_PHOTO)
        tableView.registerClass(FeedVideoTableViewCell.self, forCellReuseIdentifier: FEED_CELL_IDENTIFIER_VIDEO)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 411
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .None
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = data[indexPath.section]
        
        var identifier = FEED_CELL_IDENTIFIER
        if let media = post.media {
            if media.type == .Image {
                 identifier = FEED_CELL_IDENTIFIER_PHOTO
            }
            if media.type == .Video {
                identifier = FEED_CELL_IDENTIFIER_VIDEO
            }
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell.selectionStyle = .None
        
        if let cell = cell as? FeedTableViewCell {
            cell.labelContent.text = post.content
            cell.labelTime.text = post.time.uppercaseString
            cell.labelUsername.text = post.username.uppercaseString
            cell.labelCommunityName.text = post.community.uppercaseString
        }
        
        if let media = post.media, url = NSURL(string: media.url) {
            let aspectWidth = UIScreen.mainScreen().bounds.width / CGFloat(media.width)
            let aspectHeight = UIScreen.mainScreen().bounds.height / CGFloat(media.height)
            let ratio = min(aspectWidth, aspectHeight)
            let newHeight = CGFloat(media.height) * ratio

            if let cell = cell as? FeedPhotoTableViewCell where media.type == .Image {
                cell.imageMedia.snp_remakeConstraints(closure: { (make) in
                    make.height.equalTo(newHeight).priority(999)
                })
                cell.imageMedia.kf_setImageWithURL(url, placeholderImage: UIImage(), optionsInfo: [.Transition(ImageTransition.Fade(1))], progressBlock: { (receivedSize, totalSize) in
                    cell.progressView.alpha = 1.0
                    let progress = Float(receivedSize / totalSize)
                    cell.progressView.setProgress(progress, animated: true)
                }, completionHandler: { _ in
                    cell.progressView.progress = 0
                    cell.progressView.alpha = 0.5
                })
            }
            
            if let cell = cell as? FeedVideoTableViewCell where media.type == .Video {
                cell.videoView.player.replaceCurrentItemWithPlayerItem(AVPlayerItem(URL: url))
                cell.videoView.snp_makeConstraints(closure: { (make) in
                    make.height.equalTo(newHeight).priority(999)
                })
                
                cell.accessoryImage.image = UIImage(named: "unmute")
                cell.accessoryImage.image?.imageWithRenderingMode(.AlwaysTemplate)
                cell.accessoryImage.tintColor = UIColor.whiteColor()
                
                cell.videoView.addSubview(cell.accessoryImage)
                
                cell.accessoryImage.snp_makeConstraints { (make) in
                    make.left.equalTo(cell.videoView).offset(20)
                    make.bottom.equalTo(cell.videoView).offset(-15)
                    make.height.width.equalTo(20)
                }
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? FeedVideoTableViewCell {
            cell.videoView.player.play()
            cell.accessoryImage.alpha = 0.2
            cell.videoView.player.rate = 1.0
            cell.videoView.player.volume = 0
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let post = data[indexPath.section]
        if let media = post.media where media.type == .Video {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            if let cell = cell as? FeedVideoTableViewCell {
                if cell.videoView.player.volume < 1 {
                    cell.videoView.player.volume = 1.0
                    UIView.animateWithDuration(0.4, animations: {
                        cell.accessoryImage.alpha = 1.0
                    })
                } else {
                    cell.videoView.player.volume = 0.0
                    UIView.animateWithDuration(0.4, animations: {
                        cell.accessoryImage.alpha = 0.2
                    })
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 60
    }
}