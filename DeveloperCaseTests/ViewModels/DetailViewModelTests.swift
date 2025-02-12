import XCTest
@testable import DeveloperCase

final class DetailViewModelTests: XCTestCase {
    
    var mockViewModel: DetailViewModel!
    var mockUser: User!
    
    override func setUp() {
        super.setUp()
        mockUser = User(
            id: 1,
            name: "Test User",
            username: "testuser",
            email: "test@example.com",
            address: Address(
                street: "Test St",
                suite: "1A",
                city: "Test City",
                zipcode: "12345",
                geo: Geo(
                    lat: "40.7128",
                    lng: "-74.0060"
                )
            ),
            phone: "123-456-7890",
            website: "test.com",
            company: Company(
                name: "Test Company",
                catchPhrase: "Test Catch Phrase",
                bs: "Test BS"
            )
        )
        mockViewModel = DetailViewModel(user: mockUser)
    }
    
    override func tearDown() {
        mockViewModel = nil
        mockUser = nil
        super.tearDown()
    }
    
    func testUserDataIsCorrect() {
        // Given
        let user = mockViewModel.getUser
        
        // Then
        XCTAssertEqual(user?.name, "Test User")
        XCTAssertEqual(user?.email, "test@example.com")
        XCTAssertEqual(user?.address?.city, "Test City")
        XCTAssertEqual(user?.company?.name, "Test Company")
    }
    
    func testUserLocationData() {
        // Given
        let user = mockViewModel.getUser
        
        // Then
        XCTAssertEqual(user?.address?.geo?.lat, "40.7128")
        XCTAssertEqual(user?.address?.geo?.lng, "-74.0060")
    }
} 
