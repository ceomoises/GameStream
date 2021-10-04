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
    
    @State var correo = ""
    @State var contrasena = ""
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                //Campo Correo Electronico
                Text("Correo electrónico").bold()
                ZStack(alignment:.leading){
                    if correo.isEmpty{
                        Text("Escribe tú correo electronico").font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $correo)
                }
                Divider().frame( height: 1)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                //Campo Contraseña
                Text("Contraseña").bold()
                    .foregroundColor(Color("light-gray"))
                
                ZStack(alignment:.leading){
                    if contrasena.isEmpty{
                        Text("Escribe tú contraseña aquí").font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("", text: $contrasena)
                }
                Divider().frame( height: 1)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?").font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .padding(.bottom)
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESÍON").fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(lineWidth: 2.0).shadow(color: .white, radius: 6))
                    
                })
                
                Text("Inicia sesión con redes sociales").foregroundColor(.white)
                    .frame(width: 300, alignment: .center)
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 10, trailing: 0))
                HStack{
                    Button(action: {print("iniciar facebook")}, label: {
                        Text("Facebook").fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40, alignment: .center)
                            .background(Color(.white).opacity(0.1))
                    }).cornerRadius(8.0)
                    
                    Button(action: {print("iniciar twitter")}, label: {
                        Text("Twitter").fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40, alignment: .center)
                            .background(Color(.white).opacity(0.1))
                    }).cornerRadius(8.0)
                }.foregroundColor(.white)
                
            }.foregroundColor(Color("dark-cian"))
                .padding()
            
        }.padding(.horizontal,77.0)
    }
}

func iniciarSesion(){
    print("Estoy iniciando sesión")
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
