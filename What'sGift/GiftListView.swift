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
                ScrollView(.horizontal){
                    CategoriView()
                }
                Divider()
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 30) {
                        ForEach(0...20, id: \.self) { value in
                            NavigationLink(destination:Text("")) {
                                GiftItem()
                            }
                        }
                    }
                    
                }
            }
        }
    }
    @ViewBuilder
    func CategoriView()->some View {
        var categori : [Categori] = [.age,.birthday,.friend,.lover,.price,.sex]
        HStack{
            ForEach(categori,id:\.self){ value in
                VStack{
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 80,height: 80)
                        .aspectRatio(contentMode: .fill)
                    Text(value.filtering)
                }.background(
                    Rectangle()
                        .stroke()
                ).aspectRatio(contentMode: .fit)
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
