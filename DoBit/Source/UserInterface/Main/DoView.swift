//
//  DoView.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/09.
//

import SwiftUI

struct DoView: View {
    @Environment(\.presentationMode) var mode
    
    let rowHeight = CGFloat(45)
    let screenSize = UIScreen.main.bounds
    var textFieldWidth: CGFloat {
        screenSize.width * 0.7
    }
    
    @State private var habitname: String = ""
    @State private var habitWhen: String = ""
    @State private var habitWhere: String = ""
    @State private var habitStart: String = ""
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack {
                BorderlineView()
                    .padding(.top, 37)
                
                miniHabit
                    .frame(height: rowHeight)
                
                BorderlineView()
                
                whenWhereStart
                    .frame(height: rowHeight * 3 + 10)
                
                BorderlineView()
                

            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    Image("backButtonIcon")
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Do")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // check action
                }) {
                    Image("checkIcon")
                }
            }
        }
    }
}

struct DoView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
            DoView()
.previewInterfaceOrientation(.portrait)
//        }
    }
}


extension DoView {
    var backgroundColor: some View {
        Color.dobitBackgroundColor
            .edgesIgnoringSafeArea(.all)
    }
    
    var miniHabit: some View {
        Group {
            VStack {
                HStack(alignment: .top) {
                    Text("작은 습관")

                        .padding(.leading, 20)
                    Spacer()
                    TextField("입력해주세요.", text: $habitname)
                        .frame(width: screenSize.width * 0.7)
                }
                Spacer()
            }
        }
    }
    
    var whenWhereStart: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    Text("언제")
                        .lightGraySetting()
                        .padding(.leading, 20)
                    Spacer()
                    TextField("입력해주세요.", text: $habitWhen)
                        .frame(width: screenSize.width * 0.7)
                }
                Spacer()
            }
            
            grayBorderLine
            
            VStack {
                HStack(alignment: .top) {
                    Text("어디서")
                        .lightGraySetting()
                        .padding(.leading, 20)
                    Spacer()
                    TextField("입력해주세요.", text: $habitWhere)
                        .frame(width: screenSize.width * 0.7)
                }
                Spacer()
            }
            
            grayBorderLine
            
            VStack {
                HStack(alignment: .top) {
                    Text("시작하기")
                        .lightGraySetting()
                        .padding(.leading, 20)
                    Spacer()
                    TextField("입력해주세요.", text: $habitStart)
                        .frame(width: screenSize.width * 0.7)
                }
                Spacer()
            }
        }
    }
    
    var grayBorderLine: some View {
        HStack {
            Spacer()
            Color.gray
                .frame(width: screenSize.width * 0.7,height: 1)
        }
    }
}



