//
//  CreatePostVC.swift
//  Fart Club
//
//  Created by Ben Sullivan on 19/05/2016.
//  Copyright © 2016 Sullivan Applications. All rights reserved.
//

import UIKit
import Spring
import AVFoundation
import FDWaveformView
import FirebaseStorage

class CreatePostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var recordButton: SpringButton!
  @IBOutlet weak var playButton: SpringButton!
  @IBOutlet weak var pauseButton: SpringButton!
  
  @IBOutlet weak var descriptionTextField: MaterialTextField!
  @IBOutlet weak var controlsBackground: MaterialView!
  @IBOutlet weak var timerViewCover: UIView!
  @IBOutlet weak var waveFormView: FDWaveformView!
  
  private let imagePicker = UIImagePickerController()
  
  var pressed = false
  var recordingSuccess = Bool()
  var recordingSession: AVAudioSession!
  var audioRecorder: AVAudioRecorder!
  var player = AVAudioPlayer()
  
  //MARK: - VC Lifecycle
  
  override func viewDidLoad() {
    
    setupRecording()
    
    imagePicker.delegate = self
    
    playButton.alpha = 0
    pauseButton.alpha = 0
    
    controlsBackground.backgroundColor = UIColor(colorLiteralRed: 105/255, green: 184/255, blue: 252/255, alpha: 1.0)
    
    playButton.imageView?.contentMode = .ScaleAspectFit
    pauseButton.imageView?.contentMode = .ScaleAspectFit
    recordButton.imageView?.contentMode = .ScaleAspectFit
  }
  
  //MARK: - Audio controls
  
  @IBAction func playButtonPressed(sender: SpringButton!) {
    play(NSURL(fileURLWithPath: String(getDocumentsDirectory()) + "recording.m4a"))
  }
  
  @IBAction func pauseButtonPressed(sender: AnyObject) {
    pause()
  }
  
  @IBAction func recordButtonPressed(sender: UIButton) {
    
    recordTapped()
    animateRecordControls()
  }
    
  func showWaveForm(fileURL: NSURL) {
    
    self.waveFormView.audioURL = fileURL
    self.waveFormView.doesAllowScrubbing = false
    self.waveFormView.alpha = 1.0
  }
  
  func waveformViewDidRender(waveformView: FDWaveformView) {
    self.waveFormView.alpha = 1.0
  }
  
  @IBAction func takePhotoButtonPressed(sender: AnyObject) {
    
    presentViewController(imagePicker, animated: true, completion: nil)
  }
  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    dismissViewControllerAnimated(true, completion: nil)    
  }
  
  
  //MARK: - Animations etc...
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    self.view.endEditing(true)
  }
  
  func animateRecordControls() {
    
    if !pressed {
      //      timerViewCover.alpha = 1
      
      //      timerMic.y = 100
      //      timerMic.duration = 10
      //      timerMic.animateTo()
      
      //      recordButton.setImage(UIImage(named: "micIconRecording"), forState: .Normal)
      
      controlsBackground.backgroundColor = UIColor(colorLiteralRed: 252/255, green: 71/255, blue: 103/255, alpha: 1.0)
      
      recordButton.duration = 1
      recordButton.animation = "pop"
      
      recordButton.animateToNext {
        self.recordButton.duration = 1
        self.recordButton.animation = "pop"
        //if button pressed, return from function to stop animation etc...
        self.recordButton.animateToNext {
          self.recordButton.duration = 1
          self.recordButton.animation = "pop"
          
          self.recordButton.animateToNext {
            self.recordButton.duration = 1
            self.recordButton.animation = "pop"
            
            self.recordButton.animateToNext {
              self.recordButton.duration = 1
              self.recordButton.animation = "pop"
              
              self.recordButton.animateToNext {
                self.recordButton.duration = 1
                self.recordButton.animation = "pop"
                
                self.recordButton.animateToNext {
                  self.recordButton.duration = 1
                  self.recordButton.animation = "pop"
                  
                  self.recordButton.animateToNext {
                    self.recordButton.duration = 1
                    self.recordButton.animation = "pop"
                    
                    self.recordButton.animateToNext {
                      self.recordButton.duration = 1
                      self.recordButton.animation = "pop"
                      
                      self.recordButton.animateToNext {
                        self.recordButton.duration = 1
                        self.recordButton.animation = "pop"
                        
                        self.recordButton.animateToNext {
                          self.recordButton.duration = 1
                          self.recordButton.animation = "pop"
                          
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      pressed = true
      
    } else {
      
      
      pauseButton.alpha = 1
      
      playButton.damping = 0.8
      playButton.x = -self.view.bounds.width / 3.5
      playButton.animateTo()
      
      pauseButton.alpha = 1
      
      pauseButton.damping = 0.8
      pauseButton.x = self.view.bounds.width / 3.5
      pauseButton.animateTo()
      
      controlsBackground.backgroundColor = UIColor(colorLiteralRed: 105/255, green: 184/255, blue: 252/255, alpha: 1.0)
      
      pressed = false
    }
    
  }
  
}
