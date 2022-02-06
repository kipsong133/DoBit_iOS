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
        // MARK: - 개발을 위해서 "!"을 붙임 나중에 제거할 것 22.02.06
        if !shouldShowMainView {
            MainTab()
                .onAppear {
                    configureAppearance()
                }
//            MainView(vm: MainViewVM())
        } else {
            LoginView(shouldShowMainView: $shouldShowMainView)
        }
    }
    
    private func configureAppearance() {
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor(
            red: 209/255, green: 209/255, blue: 209/255, alpha: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
