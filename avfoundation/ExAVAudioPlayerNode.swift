import AVFoundation

// MARK: - Safety Schedule Segment

extension AVAudioPlayerNode {
    
    func scheduleSegment(file: AVAudioFile, startingFrame: AVAudioFramePosition, frameCount: AVAudioFrameCount, at time: AVAudioTime? = nil, completionHandler: (() -> ())? = nil) {
        print(#function, "startingFrame: \(startingFrame)", "frameCount: \(frameCount)")
        guard 0 ... file.length ~= startingFrame, 1 ... UInt32(file.length) ~= frameCount else {
            print("AVAudioPlayerNode.scheduleSegment: incorrect argment")
            return
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
