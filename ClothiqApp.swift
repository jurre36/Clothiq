import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Clothiq")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                // Login & Registration Buttons
                VStack(spacing: 15) {
                    NavigationLink(destination: LoginView()) {
                        Text("Inloggen met e-mailadres")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: RegisterEmailView()) {
                        Text("Registreren")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Apple login action
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Inloggen met Apple")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }

                    Button(action: {
                        // Google login action
                    }) {
                        HStack {
                            Image(systemName: "globe")
                            Text("Inloggen met Google")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Proceed without account action
                    }) {
                        Text("Doorgaan zonder account")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
