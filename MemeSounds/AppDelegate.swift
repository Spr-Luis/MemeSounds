//
//  AppDelegate.swift
//  MemeSounds
//
//  Created by Luis Chávez on 29/07/18.
//  Copyright © 2018 Luis Chávez. All rights reserved.
//

import Cocoa
import AVFoundation
import AVFoundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    private var player: AVAudioPlayer? =  nil
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("sad_button"))
        }
        constructMenu()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func constructMenu() {
        let menu = NSMenu()

        menu.addItem(NSMenuItem(title: "Hello Darkness", action: #selector(AppDelegate.play(sender:)), keyEquivalent: "h"))
        menu.addItem(NSMenuItem(title: "Blonde Redhead", action: #selector(AppDelegate.play(sender:)), keyEquivalent: "a"))
        menu.addItem(NSMenuItem(title: "Sad Violin", action: #selector(AppDelegate.play(sender:)), keyEquivalent: "v"))
        menu.addItem(NSMenuItem(title: "Turn Down For What", action: #selector(AppDelegate.play(sender:)), keyEquivalent: "t"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    
    @objc private func play(sender: NSMenuItem) {
        
        switch sender.keyEquivalent {
        case "h":
            playSound(file: "HELLO_DARKNESS_MY_OLD_FRIEND", ext: "mp3")
        case "a":
            playSound(file: "blonde_redhead", ext: "mp3")
        case "v":
            playSound(file: "sad_violin", ext: "mp3")
        case "t":
            playSound(file: "turn_down_for_what", ext: "mp3")

        default:
            break
        }
        
    }
    
    func playSound(file:String, ext:String) -> Void {
        let url = Bundle.main.url(forResource: file, withExtension: ext)!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

