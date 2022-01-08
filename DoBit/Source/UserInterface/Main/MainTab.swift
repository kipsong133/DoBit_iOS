//
//  MainTab.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/08.
//

import SwiftUI


struct MainTab: View {
  
    var body: some View {
        TabView {
            MainView(vm: MainViewVM())
                .tabItem {
                    Image("homeIcon")
                }
            
            Text("Track")
                .tabItem {
                    Image("homeIcon")
                }
            
            Text("Calander")
                .tabItem {
                    Image("homeIcon")
                }
        }
    }

    var blackBorder: some View {
        Color.black
            .frame(width: UIScreen.main.bounds.width, height: 1)
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
