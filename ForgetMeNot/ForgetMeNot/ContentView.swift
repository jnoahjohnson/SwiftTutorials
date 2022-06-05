//
//  ContentView.swift
//  ForgetMeNot
//
//  Created by Noah Johnson on 4/12/22.
//

import SwiftUI

struct Person: Identifiable, Codable {
    var id = UUID()
    var imagePath: URL
    let name: String
}

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var showingNameForm = false
    @State private var inputImage: UIImage?
    @State private var inputName = ""
    @State private var people: [Person] = []
    @Environment(\.dismiss) var dismiss
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveImage() -> URL {
        let filePath = getDocumentsDirectory().appendingPathComponent("\(inputName).jpg")
        
        if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: filePath, options: [.atomic, .completeFileProtection])
        }
        
        return filePath
    }
    
    func loadData() {
        let filePath = getDocumentsDirectory().appendingPathComponent("data.json")
        
        do {
            let personData = try Data(contentsOf: filePath)
            
            let decoder = JSONDecoder()
            
            if let jsonData = try? decoder.decode([Person].self, from: personData) {
                print(jsonData)
                people = jsonData
            }
            
        } catch {
            print("Error loading data!")
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(people) { person in
                        NavigationLink {
                            PersonView(person: person)
                        } label: {
                            Text(person.name)
                        }
                    }
                }
            }
            
            .onAppear(perform: loadData)
            .navigationTitle("Forget Me Not")
            .toolbar {
                ToolbarItem {
                    Button("Add Person") {
                        // Select an image
                        showingImagePicker = true
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .sheet(isPresented: $showingNameForm) {
                VStack {
                    Form {
                        Section {
                            image?
                                .resizable()
                                .scaledToFill()
                        }
                        
                        Section {
                            TextField("What is the person's name?", text: $inputName)
                            
                            Button("Save") {
                                let imagePath = saveImage()
                                
                                people.append(Person(imagePath: imagePath, name: inputName))
                                
                                let encoder = JSONEncoder()
                                if let personData = try? encoder.encode(people),
                                   let jsonString = String(data: personData, encoding: .utf8)
                                {
                                    let filePath = getDocumentsDirectory().appendingPathComponent("data.json")
                                    do {
                                        try jsonString.write(to: filePath, atomically: true, encoding: .utf8)
                                        
                                    } catch {
                                        print("Error writing to JSON")
                                    }
                                }
                                
                                showingNameForm = false
                            }
                        }
                        
                    }
                }
                
            }
            .onChange(of: inputImage) { _ in
                loadImage()
                showingNameForm = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
