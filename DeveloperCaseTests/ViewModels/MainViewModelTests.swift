import XCTest
@testable import DeveloperCase

final class MainViewModelTests: XCTestCase {

    var mockViewModel: MainViewModel!
    var mockUserService: MockUserService!
    var mockDelegate: MockMainViewModelDelegate!

    override func setUp() {
        super.setUp()
        mockUserService = MockUserService()
        mockDelegate = MockMainViewModelDelegate()
        mockViewModel = MainViewModel(userService: mockUserService)
        mockViewModel.delegate = mockDelegate
    }

    override func tearDown() {
        mockViewModel = nil
        mockUserService = nil
        mockDelegate = nil
        super.tearDown()
    }

    func testFetchUsersSuccess() async {

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            mockUserService.setupMockUsers()
            mockViewModel.fetchUsers()
        }
        // Then
        XCTAssertEqual(mockViewModel.getUsers.count, 2)
        XCTAssertEqual(mockViewModel.getUsers[0].name, "Test User 1")
        XCTAssertEqual(mockViewModel.getUsers[1].email, "test2@example.com")
        XCTAssertTrue(mockDelegate.usersFetchedCalled)
    }

    func testFetchUsersFailure() async {
        // Given
        mockUserService.shouldFail = true

        // When
        mockViewModel.fetchUsers()

        // Then
        XCTAssertTrue(mockViewModel.getUsers.isEmpty)
        XCTAssertFalse(mockDelegate.usersFetchedCalled)
    }
}

final class MockMainViewModelDelegate: MainViewModelDelegate {
    var usersFetchedCalled = false

    func usersFetched() {
        usersFetchedCalled = true
    }
}
