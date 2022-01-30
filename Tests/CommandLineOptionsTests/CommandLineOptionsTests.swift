import XCTest
@testable import CommandLineOptions

final class CommandLineOptionsTests: XCTestCase {
    
    func testHelpNoArg() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help")
        
        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
    }
    
    func testHelpWithArg() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help")
        args.append("app")
        
        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
        XCTAssertTrue(opts.helpForCommand == "app", "Help command does not match")
    }
    
    func testHelpWithArgLongForm() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help=app")
        
        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
        XCTAssertTrue(opts.helpForCommand == "app", "Help command does not match")
    }
    
    func testMultipleSinglets() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help")
        args.append("--verbose")
        
        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
        XCTAssertTrue(opts.verbose, "Verbose is not found")
    }
    
    func testMultipleShortForm() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help")
        args.append("app")
        args.append("--user")
        args.append("testuser")

        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
        XCTAssertTrue(opts.helpForCommand == "app", "Help command does not match")
        XCTAssertTrue(opts.user == "testuser", "User does not match")
    }
    
    func testMultipleLongForm() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help=app")
        args.append("--user=testuser")

        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
        XCTAssertTrue(opts.helpForCommand == "app", "Help command does not match")
        XCTAssertTrue(opts.user == "testuser", "User does not match")
    }
    
    func testMultipleMixedForm() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help")
        args.append("app")
        args.append("--user=testuser")

        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
        XCTAssertTrue(opts.helpForCommand == "app", "Help command does not match")
        XCTAssertTrue(opts.user == "testuser", "User does not match")
    }
    
    func testMixedFormAndSinglets() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help")
        args.append("app")
        args.append("--verbose")
        args.append("--user")
        args.append("testuser")

        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
        XCTAssertTrue(opts.helpForCommand == "app", "Help command does not match")
        XCTAssertTrue(opts.user == "testuser", "User does not match")
        XCTAssertTrue(opts.verbose, "Verbose is not found")
    }
    
    func testMixedFormAndSingletsVerboseFalse() throws {
        var args : [String] = [String]()
        args.append("/path/to/executable")
        args.append("--help")
        args.append("app")
        args.append("--user")
        args.append("testuser")

        let opts : Options = Options(args: args)
        XCTAssertTrue(opts.showHelp, "Help is not found")
        XCTAssertTrue(opts.helpForCommand == "app", "Help command does not match")
        XCTAssertTrue(opts.user == "testuser", "User does not match")
        XCTAssertFalse(opts.verbose, "Verbose is not found")
    }
    
}
