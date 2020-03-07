import SwiftUI

@available(iOS 13, *)
public struct FloatingLabelTextField: View {
    
    @State private var placeHolder: String = ""
    @State private var placeHolderLabel: String = ""
    private var placeHolderValue: String = ""
    @Binding var text: String
    @State private var isActive: Bool = false
    
    public init(placeHolder: String = "Please Input",
                text: Binding<String> = .constant("") ) {
        self._text = text
        self.placeHolderValue = placeHolder
    }
    
    private func updateEditMode(edit: Bool) {
        if edit {
            self.placeHolderLabel = self.placeHolderValue
            self.placeHolder = ""
            self.isActive = true
        } else {
            if self.text.count == 0 {
                self.placeHolder = self.placeHolderValue
                self.placeHolderLabel = ""
            }
            self.isActive = false
        }
    }
    
    public var body: some View {
        let lineHeight: CGFloat = self.isActive ? 2 : 1
        let lineColor = self.isActive ? Color.blue : Color.gray
        
        return VStack(alignment: .leading) {
            Text(placeHolderLabel).font(.footnote).foregroundColor(.gray)
            
            TextField(placeHolder, text: $text, onEditingChanged: { (edit) in
                self.updateEditMode(edit: edit)
            })
                .font(Font.custom("poppins", size: 20))
                .onAppear {
                    self.placeHolder = self.placeHolderValue
                    
            }
            
            
            
            Rectangle()
                .fill(lineColor)
                .frame(minHeight: lineHeight, idealHeight: lineHeight, maxHeight: lineHeight, alignment: .center)
            
        }
        .padding(.horizontal,20)
        .padding(.vertical, 15)
    }
    
}


