//
//  home_view.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import SwiftUI

struct home_view: View {
    @EnvironmentObject var session: user_session

    var body: some View {
        VStack {
            //Karsilama Text
            HStack{
                Text(session.userName.isEmpty ? "Merhaba" : "Merhaba, \(session.userName)")
            }
        }

    }
}

#Preview {
    home_view()
        .environmentObject(user_session())
}
