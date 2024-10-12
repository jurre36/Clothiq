import SwiftUI

struct RegisterEmailView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack {
            TextField("E-mailadres", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Wachtwoord", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("Minimaal 10 karakters*\nMinimaal 1 Speciaal Teken*\nMinimaal 1 Hoofdletter*\nMinimaal 1 Cijfer*")
                .font(.caption)
                .padding(.horizontal)

            SecureField("Wachtwoord Herhalen", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button(action: {
                    // Go back
                }) {
                    Text("Vorige")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }

                Button(action: {
                    // Proceed to next step
                }) {
                    Text("Doorgaan")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Registreren")
    }
}
