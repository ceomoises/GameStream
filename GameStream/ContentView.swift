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
                
                //--> CAMPO CORREO
                Text("Correo electrónico").bold()
                    .foregroundColor(Color("dark-cian"))
                    
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
                
                //--> CAMPO CONTRASEÑA
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
                
                // --> BOTONES DE INICIO DE SESIÓN
                
                Text("¿Olvidaste tu contraseña?").font(.footnote)
                    .foregroundColor(Color("dark-cian"))
                    .frame(width: 300, alignment: .trailing)
                    .padding(.bottom)
               
                Button(action: iniciarSesion){
                    Text("INICIAR SESÍON").fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("dark-cian"),lineWidth: 2.0)
                                    .shadow(color: .white, radius: 6))
                }
                
                Text("Inicia sesión con redes sociales").foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 10, trailing: 0))
                
                HStack{
                    Button(action: {print("iniciar facebook")}){
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical,8.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                    Button(action: {print("iniciar twitter")}){
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical,8.0)
                            .frame(maxWidth: .infinity,alignment: .center)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                }
                
            }.padding(.horizontal,42.0)
        }
        
    }
}

func iniciarSesion(){
    print("Estoy iniciando sesión")
}

struct RegistroView:View{
    
    @State var correo = ""
    @State var contrasena = ""
    @State var confirmarContrasena = ""
    
    var body: some View {
        
        ScrollView{
            
            //FOTOGRAFIA
            VStack(alignment:.center){
                Text("Elige una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(Color("light-gray"))
                Text("Puedes cambiar o elegir más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                Button(action: tomarFoto){
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
            
            //VStack-Formulario
            VStack(alignment: .leading){
                
                //VStack-EntradasTexto
                VStack(alignment:.leading){
                    //--> CAMPO CORREO
                    Text("Correo electrónico*").bold()
                        .foregroundColor(Color("dark-cian"))
                    
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
                    
                    //--> CAMPO CONTRASEÑA
                    Text("Contraseña*").bold()
                        .foregroundColor(Color("light-gray"))
                    
                    ZStack(alignment:.leading){
                        if contrasena.isEmpty{
                            Text("Escribe tú contraseña").font(.caption)
                                .foregroundColor(.gray)
                        }
                        SecureField("", text: $contrasena)
                    }
                    Divider().frame( height: 1)
                        .background(Color("dark-cian"))
                        .padding(.bottom)
                    
                    // --> CAMPO CONFIRMAR
                    Text("Confirmar contraseña*").bold()
                        .foregroundColor(Color("light-gray"))
                    
                    ZStack(alignment:.leading){
                        if confirmarContrasena.isEmpty{
                            Text("Escribe de nuevo tú contraseña").font(.caption)
                                .foregroundColor(.gray)
                        }
                        SecureField("", text: $confirmarContrasena)
                    }
                    Divider().frame( height: 1)
                        .background(Color("dark-cian"))
                        .padding(.bottom)
                }.padding(.bottom)//VStack-EntradasTexto
                
                Button(action: registrate){
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
                    Button(action: {print("Registrarse con facebook")}){
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical,8.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                    Button(action: {print("Registrarse con twitter")}){
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical,8.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                }
            }.padding(.horizontal, 42.0)//VStack-Formulario
        }//ScrollView
    }//body
}//RegistroView

func registrate(){
    print("registrandose...")
}

func tomarFoto(){
    print("tomando foto...")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
