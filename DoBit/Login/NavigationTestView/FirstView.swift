//
//  FirstView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/02.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()) {
                    Text("Hello, World!")
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
