//
//  ContentView.swift
//  GameStream
//
//  Created by Moisés on 03/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.07, green: 0.12, blue: 0.24).ignoresSafeArea()
            VStack{
                Image("applogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 42)
                InicioRegistroView()
            }
            
        }
    }
}

struct InicioRegistroView:View{
    
    @State var tipoInicioSesion = true
    
    var body: some View{
        VStack{
            HStack {
                Spacer()
                Button("INICIA SESIÓN"){
                    tipoInicioSesion = true
                    print("Pantalla inicio sesión")
                }.foregroundColor( tipoInicioSesion ? .white: .gray)
                Spacer()
                Button("REGÍSTRATE"){
                    tipoInicioSesion = false
                    print("Pantalla de registro")
                }.foregroundColor( tipoInicioSesion ? .gray: .white)
                Spacer()
            }
            Spacer(minLength: 42)
            if tipoInicioSesion == true {
                InicioView()
            }else{
                RegistroView()
            }
        }
    }
}

struct InicioView:View{
    var body: some View {
        Text("Soy la vista de inicio de sesión")
    }
}
struct RegistroView:View{
    var body: some View {
        Text("Soy la vista de registro")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Image("pantalla01")
    }
}
