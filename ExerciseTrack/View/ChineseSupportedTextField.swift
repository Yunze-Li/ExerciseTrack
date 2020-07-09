//
//  ChineseSupportedTextField.swift
//  ExerciseTrack
//
//  Created by Yunze Li on 09/07/2020.
//  Copyright © 2020 Arctos. All rights reserved.
//

import SwiftUI

struct ChineseSupportedTextField: UIViewRepresentable {
    @Binding var text: String
    private let textField = UITextField()
    
    init(_ localizedStringKey: String, text: Binding<String>) {
        _text = text
        textField.placeholder = localizedStringKey
        textField.textAlignment = .right
    }
    
    func makeUIView(context: UIViewRepresentableContext<ChineseSupportedTextField>) -> UITextField {
        textField.delegate = context.coordinator
        return textField
    }
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<ChineseSupportedTextField>) {}
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var markedTextField: ChineseSupportedTextField
        
        init(_ markedTextField: ChineseSupportedTextField) {
            self.markedTextField = markedTextField
            super.init()
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(Self.textDidchange(_:)),
                                                   name: UITextField.textDidChangeNotification,
                                                   object: markedTextField.textField)
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
        
        @objc private func textDidchange(_ notification: Notification) {
            let textField = markedTextField.textField
            if textField.markedTextRange == nil {
                markedTextField.text = textField.text ?? String()
            }
        }
    }
}
