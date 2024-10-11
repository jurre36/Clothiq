import SwiftUI

struct RegisterPersonalInfoView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: Double = 25
    @State private var termsAccepted: Bool = false

    var body: some View {
        VStack {
            TextField("Voornaam", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Achternaam", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Age Slider
            VStack {
                Text("Leeftijd: \(Int(age))")
                Slider(value: $age, in: 0...100)
                    .padding()
            }

            // Terms and Conditions
            Toggle(isOn: $termsAccepted) {
                Text("Ik ga akkoord met de algemene voorwaarden en het privacybeleid.")
            }
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
                    // Registration complete
                }) {
                    Text("Registreren")
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
