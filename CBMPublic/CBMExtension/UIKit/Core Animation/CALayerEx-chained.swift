import UIKit

extension CALayer {
    func makeFrame(frame : CGRect) -> Self {
        self.frame = frame
        return self
    }
    func makeSize(size : CGSize) -> Self {
        frame.size = size
        return self
    }
    func makePosition(position : CGPoint) -> Self {
        self.position = position
        return self
    }
    
}

