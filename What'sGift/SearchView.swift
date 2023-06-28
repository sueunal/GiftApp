//
//  SearchView.swift
//  What'sGift
//
//  Created by sueun kim on 2023/06/28.
//

import SwiftUI

struct SearchView: View {
    @State var SearchItem : String = ""
    var body: some View {
        VStack(alignment:.leading){
            Text("검색")
                .font(.title)
                .fontWeight(.heavy)
            SearchInputView()
            Spacer()
        }.padding()
    }
    @ViewBuilder
    func SearchInputView()-> some View{
        TextField("검색할 상품을 입력해주세요", text: $SearchItem)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
                    .fill(.linearGradient(colors:[.red,.green,.blue], startPoint: .bottomLeading, endPoint: .topTrailing))
            )
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
