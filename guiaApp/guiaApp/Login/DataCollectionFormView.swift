//
//  DataCollectionFormView.swift
//  guiaApp
//
//  Created by Alex Diaz on 11/8/24.
//

import SwiftUI


/// Crea un formulario para la collecion de datos de la app.
struct DataCollectionFormView: View {
    
    // MARK: - STATES
    @State private var selectedCompany: Set<TravelingCompany> = []
    @State private var selectedGender: Gender = .male
    @State private var selectedActivities: Set<ActivityTourism> = []
    @State private var userAge: String = ""
    @State private var userName: String = ""
    @State private var selectedNationality: Nationality = .nicaraguan
    
    // MARK: - COLUMNAS para los pickers creados con botones en LazyVGrid
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let columnsForCompany = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Text("Customize your Experience")
                .font(.system(size: 32,weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(.darkBlue)
                .padding(.top, 30)
                .lineLimit(2)
            
            //crear el picker y la edad
            inputBoxForNumbers(userNumbers: $userAge, placeholder: "Age")
            HStack {
                NationalityPicker(selectedNationality: $selectedNationality)
                GenderPicker(selectedGender: $selectedGender)
            }
            
            Text("What's your travel style?")
                .font(.system(size: 24,weight: .semibold, design: .rounded))
                .foregroundColor(.darkBlue)
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            //crear la seleccion de activitdades
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(ActivityTourism.allCases, id: \.self) { activity in
                    ActivitySelector(activity: activity,isSelected: selectedActivities.contains(activity)) {
                        if selectedActivities.contains(activity) {
                            selectedActivities.remove(activity)
                        } else {
                            selectedActivities.insert(activity)
                        }
                    }
                }
            }
            Text("Are you traveling solo or bringing along some company?")
                .font(.system(size: 24,weight: .semibold, design: .rounded))
                .foregroundColor(.darkBlue)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            LazyVGrid(columns: columnsForCompany, spacing: 10) {
                ForEach(TravelingCompany.allCases, id: \.self) { company in
                    CompanySelector(company: company,isSelected: selectedCompany.contains(company)) {
                        if selectedCompany.contains(company) {
                            selectedCompany.remove(company)
                        } else {
                            selectedCompany.removeAll()
                            selectedCompany.insert(company)
                        }
                    }
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Start Planning")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, design: .rounded))
            }
            .defaultButtonStyle()
            
        }.padding(.horizontal)
        
    }
}
#Preview {
    DataCollectionFormView()
}

/// Se usan numeros para recibir informacion. Los numeros deben ser enteros
struct inputBoxForNumbers: View {
    
    @Binding var userNumbers: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $userNumbers)
            .padding()
            .keyboardType(.numberPad)
            .background(Color.textFieldColor)
            .cornerRadius(10)
            .padding(.bottom, 10)
    }
}


/// Selecciona una nacionalidad
struct NationalityPicker: View {
    @Binding var selectedNationality: Nationality

    var body: some View {
        Picker("Select Nationality", selection: $selectedNationality) {
            ForEach(Nationality.allCases, id: \.self) { nationality in
                Text(nationality.rawValue).tag(nationality)
                    .foregroundColor(.darkBlue)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .padding()
        .background(Color.textFieldColor)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
/// Selecciona un genero
/// Se usa un enum llamado Gender
struct GenderPicker: View {
    
    @Binding var selectedGender: Gender
    
    var body: some View {
        Picker("Select Gender", selection: $selectedGender) {
            ForEach(Gender.allCases, id: \.self) { gender in
                Text(gender.rawValue).tag(gender)
                    .foregroundColor(.darkBlue)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .padding()
        .background(Color.textFieldColor)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

// hacer una selector de actividad favoritas
struct ActivitySelector: View {
    
    var activity: ActivityTourism
    var isSelected: Bool
    var toggleSelection: () -> Void
    

    var body: some View {
        Button(action: toggleSelection) {
            Text(activity.rawValue)
                .padding()
                .foregroundColor(isSelected ? .white : .grayOwnColor)
                .background(isSelected ? Color.mainColor : Color.textFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct CompanySelector: View {
    
    var company: TravelingCompany
    var isSelected: Bool
    var toggleSelection: () -> Void
    

    var body: some View {
        Button(action: toggleSelection) {
            Text(company.rawValue)
                .padding()
                .frame(width: 150)
                .foregroundColor(isSelected ? .white : .grayOwnColor)
                .background(isSelected ? Color.mainColor : Color.textFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
