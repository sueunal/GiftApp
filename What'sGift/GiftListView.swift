//
//  GiftList.swift
//  What'sGift
//
//  Created by sueun kim on 2023/06/27.
//

import SwiftUI

struct GiftListView: View {
    @State var path = NavigationPath()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack(path:$path.self){
            VStack{
                    HStack{
                        Image(systemName: "gift")
                            .resizable()
                            .frame(width: 40,height: 40)
                        Text("Gift")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                    }
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 30) {
                        ForEach(0x1f600...0x1f679, id: \.self) { value in
                            NavigationLink(destination:Text("asdf")) {
                                GiftItem()
                            }
                        }
                    }
                }
            }
        }
    }
    @ViewBuilder
    func GiftItem()-> some View{
            VStack{
                Image(systemName: "gift")
                    .resizable()
                    .frame(width: 180,height: 140)
                Text("선물 이름")
                    .font(.largeTitle)
                Text("가격")
                    .font(.title)
                Text("연령대")
                    .font(.title)
            }.background(
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundColor(.gray)
            ).aspectRatio(contentMode: .fit)
    }
}

struct GiftList_Previews: PreviewProvider {
    static var previews: some View {
        GiftListView()
    }
}
