//public struct LighterComponents {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
import SwiftUI

public struct LighterButton : View{
    var title : String
    var action : ()
    public init(title : String, action : ()) {
        self.title = title
        self.action = action
    }
    public var body: some View {
        Button {
            action
        } label: {
            Text(title)
        }

        
        
        
    }
}
