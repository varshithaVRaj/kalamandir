//
//  ContentView.swift
//  interviewTask
//
//  Created by Varshitha VRaj on 02/09/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    var body: some View {
        
        ZStack{
            
            ForEach(0..<10){ item in
                
                ScrollView{
                    HStack(){

                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading)
                        
                        Spacer()
                      
                        
                        Text("Apple")
                            .font(.headline)
                        
                        Spacer()
                           
                        Button("+"){
                            
                        }
                        
                        Spacer()
                        
                    }
                    
                }
                
               
                
            }
            
        }
        
    }
    
}

   



#Preview {
    
    ContentView()
    
}
