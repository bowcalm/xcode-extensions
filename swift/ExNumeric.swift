// MARK: - Clamp

extension Numeric where Self: Comparable {
    
    func clamp(lower: Self? = nil, upper: Self? = nil) -> Self {
        if let lower = lower, let upper = upper, lower > upper { return self }
        
        var result = self
        if let lower = lower {
            result = max(result, lower)
        }
        if let upper = upper {
            result = min(result, upper)
        }
        return result
    }
    
}
