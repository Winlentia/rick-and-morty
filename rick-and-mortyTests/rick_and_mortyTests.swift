//
//  rick_and_mortyTests.swift
//  rick-and-mortyTests
//
//  Created by Winlentia on 16.01.2021.
//

import XCTest
@testable import rick_and_morty

class rick_and_mortyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCharacterViewModel() {
        let rick = Character(id: 1,
                                  name: "Rick Sanchez",
                                  status: "Alive",
                                  species: "Human",
                                  type: "",
                                  gender: "Male",
                                  image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        
        let characterViewModel = CharacterViewModel(character: rick)
        XCTAssertEqual(characterViewModel.getSpeciesString(), "Species :👤", "Species test failure")
        
        XCTAssertEqual(characterViewModel.getStatusString(), "Status :Alive 🟢", "Status test failure")
        
    }

}
