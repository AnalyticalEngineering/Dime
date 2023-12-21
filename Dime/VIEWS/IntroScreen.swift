//
//  IntroScreen.swift
//  Dime
//
//  Created by J. DeWeese on 12/21/23.
//

import SwiftUI

struct IntroScreen: View {
    // Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    var body: some View {
        VStack(spacing: 15, content: {
            Text("What's new in \nDime Keeper")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
          //points View
            VStack(alignment: .leading, spacing: 25, content: {
               PointView(symbol: "dollarsign", title: "Transactions", subTitle: "Track your earnings and expenses")
                PointView(symbol: "chart.bar.fill", title: "Visual Charts", subTitle: "View your transactions using eye-catching graphical representations.")
                PointView(symbol: "magnifyingglass", title: "Advanced Search Filters", subTitle: "Find the expense you want by advanced search and filtering.")
            })//end of Vstack2
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15 )
            
            Spacer(minLength: 10)
            
            Button(action: {
                //Button: When pressed -> set to false, will not appear again after first usage
                isFirstTime = false
            }, label: {
               Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 12))
                    .contrast(3.0)
                    .contentShape(.rect)
            }).padding(15)
         
            
        })//End of Vstack1
        }
    
    //Point View
    @ViewBuilder
    func PointView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 20, content: {
            Image(systemName:  symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subTitle)
                    .foregroundStyle(.gray)
            })//EndofVStack 3
        })//end of hstack
    }
    }


#Preview {
    IntroScreen()
}
