import Foundation

extension Dictionary {
    mutating func merge<K, V>(with dictionarys : Dictionary<K, V>...) {
        for dictionary in dictionarys {
            for (key, value) in dictionary {
                updateValue(value as! Value, forKey: key as! Key)
            }
        }
    }
}
