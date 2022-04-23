//
//  DoView.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/09.
//

import SwiftUI

struct DoView: View {
    @Environment(\.presentationMode) var mode
    
    @State var routineData = ["미라클모닝", "미라클에프터눈", "미라클이브닝"]
    @State var environmentData = ["머리 맡에 책 두고 자기", "일어나자마자 체조하기", "21시 전에 자기"]
    @State var nextStepData = ["책펼치기", "체조하기", "노래듣기"]
    @State var copingFailureData = ["잠이라도 더 자기", "유튜브라도 보기", "명상하기"]
    
    let rowHeight = CGFloat(45)
    let screenSize = UIScreen.main.bounds
    var textFieldWidth: CGFloat { screenSize.width * 0.7 }
    
    @State private var habitname: String = ""
    @State private var habitWhen: String = ""
    @State private var habitWhere: String = ""
    @State private var habitStart: String = ""
    
    var body: some View {
        ZStack {
            backgroundColor
            ScrollView {
                VStack {
                    Group {
                        BorderlineView()
                            .padding(.top, 37)
                        // "작은 습관"
                        miniHabit
                            .frame(height: rowHeight)
                        BorderlineView()
                    }
                    
                    Group {
                        // "언제, 어디서, 시작하기"
                        whenWhereStart
                            .frame(height: rowHeight * 3 + 10)
                        BorderlineView()
                    }
                    
                    // 루틴
                    routineList
                    
                    // 환경
                    environmentList

                    // 다음단계
                    nextStepList
                    
                    // 실패대처
                    copingFailureList
                    
                    Spacer()
                }
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
                NavigationView {
        DoView()
            .previewInterfaceOrientation(.portrait)
                }
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
    
    var routineButton: some View {
        Button(action: {
            self.routineData.append("새로운거\(Int.random(in: 1...10000))")
        }) {
            VStack {
                HStack {
                    Text("루틴")
                        .padding(.leading, 20)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .padding(.trailing, 20)
                }
                Spacer()
            }
        }
    }
    
    var environemntButton: some View {
        Button(action: {
            self.environmentData.append("새로운거\(Int.random(in: 1...10000))")
        }) {
            VStack {
                HStack {
                    Text("환경")
                        .padding(.leading, 20)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .padding(.trailing, 20)
                }
                Spacer()
            }
        }
    }
    
    var nextStepButton: some View {
        Button(action: {
            self.nextStepData.append("새로운거\(Int.random(in: 1...10000))")
        }) {
            VStack {
                HStack {
                    Text("다음 단계")
                        .padding(.leading, 20)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .padding(.trailing, 20)
                }
                Spacer()
            }
        }
    }
    
    var copingFailureButton: some View {
        Button(action: {
            self.copingFailureData.append("새로운거\(Int.random(in: 1...10000))")
        }) {
            VStack {
                HStack {
                    Text("실패 대처")
                        .padding(.leading, 20)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .padding(.trailing, 20)
                }
                Spacer()
            }
        }
    }
    
    var routineList: some View {
        Group {
            routineButton
                .foregroundColor(.dobitBlack)
                .frame(height: rowHeight)
            
            BorderlineView()
            
            // 루틴 list
            LazyVStack {
                ForEach(self.routineData.indices, id: \.self) {
                    DoViewCell(
                        rowHeight: rowHeight,
                        cellTitle: self.routineData[$0], index: $0,
                        cellDataName: self.$routineData[$0],
                        deleteCell: {
                            self.routineData.remove(at: $0)
                        })
                }
            }
            BorderlineView()
        }
    }
    
    var environmentList: some View {
        Group {
            // 환경
            environemntButton
                .foregroundColor(.dobitBlack)
                .frame(height: rowHeight)
            BorderlineView()
            // 루틴 list
            LazyVStack {
                ForEach(self.environmentData.indices, id: \.self) {
                    DoViewCell(
                        rowHeight: rowHeight,
                        cellTitle: self.environmentData[$0], index: $0,
                        cellDataName: self.$environmentData[$0],
                        deleteCell: {
                            self.environmentData.remove(at: $0)
                        })
                }
            }
            BorderlineView()
        }
    }
    
    var nextStepList: some View {
        Group {
            // 환경
            nextStepButton
                .foregroundColor(.dobitBlack)
                .frame(height: rowHeight)
            BorderlineView()
            // 루틴 list
            LazyVStack {
                ForEach(self.nextStepData.indices, id: \.self) {
                    DoViewCell(
                        rowHeight: rowHeight,
                        cellTitle: self.nextStepData[$0], index: $0,
                        cellDataName: self.$nextStepData[$0],
                        deleteCell: {
                            self.nextStepData.remove(at: $0)
                        })
                }
            }
            BorderlineView()
        }
    }
    
    var copingFailureList: some View {
        Group {
            // 환경
            copingFailureButton
                .foregroundColor(.dobitBlack)
                .frame(height: rowHeight)
            BorderlineView()
            // 루틴 list
            LazyVStack {
                ForEach(self.copingFailureData.indices, id: \.self) {
                    DoViewCell(
                        rowHeight: rowHeight,
                        cellTitle: self.copingFailureData[$0], index: $0,
                        cellDataName: self.$copingFailureData[$0],
                        deleteCell: {
                            self.copingFailureData.remove(at: $0)
                        })
                }
            }
            BorderlineView()
        }
    }
}

struct DoViewCell: View {
    
    let rowHeight: CGFloat
    let cellTitle: String
    let screenSize = UIScreen.main.bounds
    let index: Int
    @Binding var cellDataName: String
    
    var deleteCell: (Int) -> Void = { _ in }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(width: screenSize.width * 0.3)
                TextField("입력해주세요.", text: $cellDataName)
                    .foregroundColor(.dobitBlack)
                
                Spacer()
                Button(action: {
                    deleteCell(index)
                }) {
                    Image(systemName: "minus")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))
                        .padding(.trailing, 20)
                }
            }
            Spacer()
            grayBorderLine
        }
        .frame(height: rowHeight)
    }
    
    var grayBorderLine: some View {
        HStack {
            Spacer()
            Color.gray
                .frame(width: screenSize.width * 0.7,height: 1)
        }
    }
}


