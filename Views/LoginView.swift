struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("E-mailadres", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Wachtwoord", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Spacer()
                Button(action: {
                    // Forgot password action
                }) {
                    Text("Wachtwoord vergeten?")
                        .font(.caption)
                }
            }
            .padding(.horizontal)

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
                    // Login action
                }) {
                    Text("Inloggen")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Inloggen")
    }
}
