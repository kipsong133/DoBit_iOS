//
//  ContentView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/01.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldShowMainView: Bool = false
    @State private var popToMainView: Bool = false
    var body: some View {
        if shouldShowMainView {
            MainView(vm: MainViewVM(),
                     rootIsActive: $popToMainView)
        } else {
            LoginView(shouldShowMainView: $shouldShowMainView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
