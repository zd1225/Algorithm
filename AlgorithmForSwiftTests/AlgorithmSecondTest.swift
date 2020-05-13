//
//  AlgorithmSecondTest.swift
//  CaculatorSwiftDemoTests
//
//  Created by 赵丹 on 2020/5/12.
//  Copyright © 2020 赵丹. All rights reserved.
//

import XCTest
@testable import AlgorithmForSwift

class AlgorithmSecondTest: XCTestCase {

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
    
    func testMergeSort(){
        var arr: [Int] = generateRandomData(n: 50, RangeL: 8, RangeR: 88)
        print(arr)
        mergeSort(arr: &arr, n: arr.count)
        print(arr)
        XCTAssert(arr[0] <= arr[1], " Sort Fail")
    }
    
    
    func testMergeSortDU(){
        var arr: [Int] = generateRandomData(n: 5, RangeL: 8, RangeR: 88)
        print(arr)
        mergeSortDU(arr: &arr, n: arr.count)
        print(arr)
        XCTAssert(arr[0] <= arr[1], " Sort Fail")
    }
    
    func testQuickSort(){
        var arr: [Int] = generateRandomData(n: 10, RangeL: 8, RangeR: 88)
        print(arr)
        quickSort(arr: &arr, n: arr.count)
        print(arr)
        XCTAssert(arr[0] <= arr[1], " Sort Fail")
    }
    
    
    
    
    
    
    /***********************************************************************************/
         /*算法性能检测*/
    /***********************************************************************************/
    
    //加判断前 50000:1.29s 1000000:31.7s；
    //加判断后 50000:1.22As 100000:31.5s
    //混合插入排序之后
    func testMergeSortPerformance(){
        self.measure{
            var arr: [Int] = generateRandomData(n: 100000, RangeL: 8, RangeR: 88)
            mergeSort(arr: &arr, n: arr.count)
        }
    }

    //50000:1.31s 100000:2.71 O(nlogN)
    func testMergeSortDUPerformance(){
        self.measure{
            var arr: [Int] = generateRandomData(n: 100000, RangeL: 8, RangeR: 88)
            mergeSortDU(arr: &arr, n: arr.count)
        }
    }
    
    
    //一路快排：50000:11.2s 100000:41.8(这是因为此数组中有大量重复元素)
    //二路快排：50000:0.78s 100000:0.516 O(logn)
    //三路快排 50000:0.226s 100000:0.463s
    func testQuickSortPerformance(){
        self.measure{
            var arr: [Int] = generateRandomData(n: 100000, RangeL: 8, RangeR: 88)
            quickSort(arr: &arr, n: arr.count)
        }
    }
    
    
    
}

