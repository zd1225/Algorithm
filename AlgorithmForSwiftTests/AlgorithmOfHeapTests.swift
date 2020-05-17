//
//  AlgorithmOfHeapTests.swift
//  AlgorithmForSwiftTests
//
//  Created by 赵丹 on 2020/5/14.
//  Copyright © 2020 赵丹. All rights reserved.
//

import XCTest
@testable import AlgorithmForSwift

class AlgorithmOfHeapTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    /***********************************************************************************/
        /*算法合法性检测*/
    /***********************************************************************************/
    
    func testHeapSort(){
        var arr: [Int] = generateRandomData(n: 5, RangeL: 8, RangeR: 88)
        heapSort(arr: &arr, n: arr.count)
        print(arr)
        XCTAssert(arr[0] <= arr[1], " Sort Fail")
    }
    
    func testHeapifySort(){
        var arr: [Int] = generateRandomData(n: 5, RangeL: 8, RangeR: 88)
        print(arr)
        heapifySort(arr: &arr, n: arr.count)
        print(arr)
        XCTAssert(arr[0] <= arr[1], " Sort Fail")
    }
    
    
    /***********************************************************************************/
        /*算法性能检测*/
    /***********************************************************************************/
     
    //堆排序O(logn)  50000:0.682s 100000:1.47s；1000000:16.9s
    func testtHeapSortPerformance(){
        self.measure{
            var arr: [Int] = generateRandomData(n: 50000, RangeL: 8, RangeR: 88)
            heapSort(arr: &arr, n: arr.count)
    
        }
    }
    
    //O(n)先将 n/2个元素抛出 50000:0.674s 100000:1.42s 1000000:16.6s
    func testtHeapifySortPerformance(){
        self.measure{
            var arr: [Int] = generateRandomData(n: 50000, RangeL: 8, RangeR: 88)
            heapifySort(arr: &arr, n: arr.count)
    
        }
    }
    
}
