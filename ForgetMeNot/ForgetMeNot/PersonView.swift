//
//  PersonView.swift
//  ForgetMeNot
//
//  Created by Noah Johnson on 4/13/22.
//

import SwiftUI

struct PersonView: View {
    var person: Person
    @State private var image: Image?
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    private func load(fileURL: URL) -> UIImage? {
        print(type(of:fileURL))
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading photo!")
        }
        
        return nil
    }
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Text(person.name)
 
        }
        .onAppear {
            let uiImage = load(fileURL: person.imagePath)
            
            if (uiImage != nil) {
                image = Image(uiImage: uiImage!)
            }
        }
        .navigationBarTitle(person.name)
    }
}

//struct PersonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonView()
//    }
//}
