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
            ScrollView {
                
                
                VStack {
                    BorderlineView()
                        .padding(.top, 37)
                    
                    // "작은 습관"
                    miniHabit
                        .frame(height: rowHeight)
                    
                    BorderlineView()
                    
                    // "언제, 어디서, 시작하기"
                    whenWhereStart
                        .frame(height: rowHeight * 3 + 10)
                    
                    BorderlineView()
                    
                    // 루틴
                    routineButton
                        .foregroundColor(.dobitBlack)
                        .frame(height: rowHeight)
                    
                    BorderlineView()
                    
                    
                    // 루틴 list
                    LazyVStack {

                        ForEach(self.routineData.indices, id: \.self) {
                            DoRoutineCell(
                                rowHeight: rowHeight,
                                cellTitle: self.routineData[$0], index: $0,
                                routineName: self.$routineData[$0],
                                deleteCell: {
                                    self.routineData.remove(at: $0)
                                })
                        }
                        
                        
                    }

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
    
}

struct DoRoutineCell: View {
    
    let rowHeight: CGFloat
    let cellTitle: String
    let screenSize = UIScreen.main.bounds
    let index: Int
    @Binding var routineName: String
    
    var deleteCell: (Int) -> Void = { _ in }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(width: screenSize.width * 0.3)
//                Text(cellTitle)
//                    .foregroundColor(.dobitBlack)
                TextField("입력해주세요.", text: $routineName)
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


