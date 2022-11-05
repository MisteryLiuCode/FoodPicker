//
//  ContentView.swift
//  FoodPicker
//
//  Created by 刘帅彪 on 2022/11/5.
//

import SwiftUI

//class SomeClass{
//    var selectedFood: String?
//}

struct ContentView: View {
//    定义食物字典
    let food = ["汉堡","沙拉","披萨","意大利面","火腿便当","刀削面","火锅","牛肉面","关东煮"]
    @State private var selectedFood: String?
//    let someClass=SomeClass()
    
    var body: some View {

        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("今天吃什么？")
                .bold()
            if selectedFood != .none{
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
            }
            //            按钮换一种方式,文字也是一个框,方便调整格式
            //            Button("告诉我!") {
            //                selectedFood = food.shuffled().filter{$0 != selectedFood}.first
            //            }.font(.title)
            //                .buttonStyle(.borderedProminent)
            //
            //            Button("重置!") {
            //                selectedFood = .none
            //            }
            //            .font(.title)
            //            .buttonStyle(.borderedProminent)
            
            Button {
                selectedFood = food.shuffled().filter{$0 != selectedFood}.first
            } label: {
                Text(selectedFood == .none ? "告诉我!":"换一个").frame(width: 200)
            }
            .buttonStyle(.borderedProminent)

            .padding(.bottom,-15)

            Button(role: .none) {
                selectedFood = .none
            } label: {
                Text("重置!").frame(width: 200)
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut, value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
