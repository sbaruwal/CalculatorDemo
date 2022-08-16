//
//  ContentView.swift
//  CalculatorDemo
//
//  Created by Sujit Baruwal on 8/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            displayText
            buttonPad
        }
        .padding(Constants.padding)
        .background(.gray.opacity(0.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContentView.ViewModel())
    }
}

extension ContentView {
    
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 80, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(viewModel.imageArray, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id:\.self) { buttons in
                        Button(action: {
                            viewModel.buttonClicked(str: buttons)
                        }) {
                            Image(buttons)
                                .resizable()
                                //.frame(width: 80.0, height: 80.0)
                        }
                    }
                }
            }
        }
    }
}
