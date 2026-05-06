//
//  SelectedResponseView.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/6/26.
//

import SwiftUI

struct SelectedResponseView: View {
    let response: Response
    
    var body: some View {
        Text(response.content)
    }
}

#Preview {
    SelectedResponseView(response: Response(id: 0, content: "Test Response"))
}
