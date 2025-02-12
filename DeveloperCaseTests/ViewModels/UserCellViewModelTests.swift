import XCTest
@testable import DeveloperCase

final class UserCellViewModelTests: XCTestCase {
    
    var mockViewModel: UserCellViewModel!
    var mockDelegate: MockUserCellViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        mockViewModel = UserCellViewModel()
        mockDelegate = MockUserCellViewModelDelegate()
        mockViewModel.delegate = mockDelegate
    }
    
    override func tearDown() {
        mockViewModel = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testConfigureCellWithValidUser() {
        // Given
        let user = User(
            id: 1,
            name: "Test User",
            username: "testuser",
            email: "test@example.com",
            address: nil,
            phone: nil,
            website: nil,
            company: nil
        )
        
        // When
        mockDelegate.configureCell(with: user)
        
        // Then
        XCTAssertEqual(mockDelegate.lastConfiguredUser?.name, "Test User")
        XCTAssertEqual(mockDelegate.lastConfiguredUser?.email, "test@example.com")
    }
    
    func testConfigureCellWithNilValues() {
        // Given
        let user = User(
            id: nil,
            name: nil,
            username: nil,
            email: nil,
            address: nil,
            phone: nil,
            website: nil,
            company: nil
        )
        
        // When
        mockDelegate.configureCell(with: user)
        
        // Then
        XCTAssertNil(mockDelegate.lastConfiguredUser?.name)
        XCTAssertNil(mockDelegate.lastConfiguredUser?.email)
    }
}

final class MockUserCellViewModelDelegate: UserCellViewModelDelegate {
    var lastConfiguredUser: User?
    
    func configureCell(with user: User) {
        lastConfiguredUser = user
    }
} 
