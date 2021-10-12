//
//  ContentView.swift
//  GameStream
//
//  Created by Moisés on 03/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var tipoInicioSesion = true
    
    var body: some View {
        ZStack {
            //Background Color with ZStack
            Color(red: 0.07, green: 0.12, blue: 0.24).ignoresSafeArea()
            VStack{
                // Image of GameStream
                Image("applogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 42)
                // Buttons of login
                HStack {
                    Spacer()
                    login
                    Spacer()
                    registro
                    Spacer()
                }
                // Type Of Login
                Spacer(minLength: 42)
                if tipoInicioSesion {
                    InicioView()
                } else{
                    RegistroView()
                }
            }
        }
    }
    
    var login: some View {
        Button("INICIA SESIÓN"){
            tipoInicioSesion = true
        }.foregroundColor( tipoInicioSesion ? .white: .gray)
    }
    var registro: some View {
        Button("REGÍSTRATE"){
            tipoInicioSesion = false
        }.foregroundColor( tipoInicioSesion ? .gray: .white)
    }
    
}

struct InicioView:View{
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
            
                inputField(title: "Correo electrónico", placeholder: "Escribe tú correo electronico")
                inputField(title: "Contraseña", placeholder: "Escribe tú contraseña aquí",plainText: false)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .foregroundColor(Color("dark-cian"))
                    .frame(maxWidth: .infinity , alignment: .trailing)
                    .padding(.bottom)
               
                Button{ print("Iniciar Sesión") } label:{
                    Text("INICIAR SESÍON")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("dark-cian"),lineWidth: 2.0)
                                    .shadow(color: .white, radius: 6))
                }
                
                Text("Iniciar sesión con redes sociales")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 10, trailing: 0))
                
                HStack {
                    Button{ print("Iniciar con Facebook") } label:{
                        socialText(nombre: "Facebook")
                    }
                    Button{ print("Iniciar con twitter") } label: {
                        socialText(nombre: "Twitter")
                    }
                }
                
            }.padding(.horizontal, 15.0)
        }
    }
}

struct RegistroView:View{
    
    var body: some View {
        ScrollView{
            // FOTOGRAFIA
            VStack(alignment:.center){
                Text("Elige una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(Color("light-gray"))
                Text("Puedes cambiar o elegir más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                Button{ print("Tomar foto") }label:{
                    ZStack {
                        Image("foto-prueba")
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                }
            }.padding(.bottom)//VStack fotografía
            // REGISTRO
            VStack(alignment: .leading){

                inputField(title:"Correo electrónico*",placeholder:"Escribe tú correo electronico")
                inputField(title: "Contraseña*", placeholder: "Escribe tú contraseña", plainText: false)
                inputField(title: "Confirmar contraseña*", placeholder: "Escribe de nuevo tú contraseña",plainText: false)
               
                Button{ print("Registrando Usuario") } label:{
                    Text("REGISTRATE").fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("dark-cian"), lineWidth: 2.0)
                                    .shadow(color: .white, radius: 6))
                }
                
                Text("Registrate con redes sociales").foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 10, trailing: 0))
                
                HStack{
                    Button{ print("Registrarse con facebook") }label:{
                        socialText(nombre: "Facebook")
                    }
                    Button{ print("Registrarse con twitter") }label:{
                        socialText(nombre: "Twitter")
                    }
                }.padding(.bottom)
            }.padding(.horizontal, 15.0)
        }
    }
}

struct inputField: View {
    
    @State var contenido = ""
    var title: String
    var placeholder: String
    var plainText : Bool = true
    
    var body: some View {
        
        Text(title).bold()
            .foregroundColor(Color("dark-cian"))
        
        ZStack(alignment:.leading){
            if plainText {
                TextField( "",text: $contenido)
            }else{
                SecureField("",text: $contenido)
            }
            if contenido.isEmpty {
                Text(placeholder)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        
        Divider().frame( height: 1)
            .background(Color("dark-cian"))
            .padding(.bottom)
    }
}

struct socialText: View {
    var nombre : String
    var body: some View {
        Text(nombre)
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.vertical,8.0)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 4.0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
