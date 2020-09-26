import AVFoundation

// MARK: - Safety Schedule Segment

extension AVAudioPlayerNode {
    
    func scheduleSegment(file: AVAudioFile, startingFrame: AVAudioFramePosition, frameCount: AVAudioFrameCount, at time: AVAudioTime? = nil, completionHandler: (() -> ())? = nil) {
        var startingFrame = startingFrame
        if !(0 ... file.length ~= startingFrame) {
            print("AVAudioPlayerNode.scheduleSegment: startingFrame wrong -> fix by mod file.length")
            while startingFrame < 0 {
                startingFrame += file.length
            }
            startingFrame %= file.length
        }
        
        var frameCount = frameCount
        if !(1 ... UInt32(file.length) ~= frameCount) {
            print("AVAudioPlayerNode.scheduleSegment: frameCount wrong -> fix to closest correct value")
            
            frameCount = frameCount <= 0 ? 1 : UInt32(file.length)
        }
        
        self.scheduleSegment(
            file,
            startingFrame: startingFrame,
            frameCount: frameCount,
            at: time,
            completionHandler: completionHandler
        )
    }
    
}
