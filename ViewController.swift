import UIKit
import AVFoundation


class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Panda", ofType: "m4a")!))
            audioPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do{
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            }
            catch{
                
            }
        }
        catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }

    @IBAction func Play(_ sender: Any) {
        audioPlayer.play()
    }

    @IBAction func Stop(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
        else {
            
        }
    }
    
    @IBAction func Replay(_ sender: Any) {
        if audioPlayer.isPlaying{
            
            audioPlayer.currentTime = 0
            audioPlayer.play()
            
        }
        else {
            audioPlayer.play()
        }
    }
}
