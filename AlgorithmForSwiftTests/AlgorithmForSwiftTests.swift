//
//  AlgorithmForSwiftTests.swift
//  AlgorithmForSwiftTests
//
//  Created by 赵丹 on 2020/5/13.
//  Copyright © 2020 赵丹. All rights reserved.
//

import XCTest
@testable import AlgorithmForSwift

class AlgorithmForSwiftTests: XCTestCase {

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

    
      func testSelectSort(){
          var arr: [Int] = generateRandomData(n: 100, RangeL: 8, RangeR: 88)
          selectionSort(arr: &arr, n: arr.count)
          XCTAssert(arr[0] <= arr[1], " Sort Fail")
      }
      
      func testInsetSort(){
          var arr: [Int] = generateRandomData(n: 100, RangeL: 8, RangeR: 88)
          insertionSort(arr: &arr, n: arr.count)
          XCTAssert(arr[0] <= arr[1], " Sort Fail")
      }
      
      func testInsertSortwithNoSwap(){
          var arr: [Int] = generateRandomData(n: 5, RangeL: 8, RangeR: 88)
          print(arr)
          insertionSortwithNoSwap(arr: &arr, n: arr.count)
          print(arr)
          XCTAssert(arr[0] <= arr[1], " Sort Fail")
      }
      
      func testBubbleSort(){
          var arr: [Int] = generateRandomData(n: 5, RangeL: 8, RangeR: 88)
          print(arr)
          bubbleSort(arr: &arr, n: arr.count)
          print(arr)
          XCTAssert(arr[0] <= arr[1], " Sort Fail")
      }
      
      func testShellSort(){
          var arr: [Int] = generateRandomData(n: 5, RangeL: 8, RangeR: 88)
          print(arr)
          shellSort(arr: &arr, n: arr.count)
          print(arr)
          XCTAssert(arr[0] <= arr[1], " Sort Fail")
      }
      
      func testShellSort2(){
          var arr: [Int] = generateRandomData(n: 5, RangeL: 8, RangeR: 88)
          print(arr)
          shellSort2(arr: &arr, n: arr.count)
          print(arr)
          XCTAssert(arr[0] <= arr[1], " Sort Fail")
      }
      
      
      
      
      
      
    /***********************************************************************************/
       /*算法性能检测*/
    /***********************************************************************************/
    
      //性能测试,测试前不可以使用，否则报错（abort program (formerly SIGIOT)：SIGABRT）
      func testSelectSortPerformance(){//10000个数据消耗 24.5s
      
          self.measure{
              var arr: [Int] = generateRandomData(n: 10000, RangeL: 8, RangeR: 88)
              selectionSort(arr: &arr, n: arr.count)
          }
          
          /*
          let exp = expectation(description: "Test")
          let res =  XCTWaiter.wait(for: [exp], timeout: 50)
          if res == .completed {
             

          } else {
              XCTAssert(false, "The call to get the URL ran into some other error")
          }
          */
      }
    
      //measure方法计算了多次的平均值
      func testInsertionSortPerformance(){//10000个数据消耗 16.4s
          self.measure{
              var arr: [Int] = generateRandomData(n: 10000, RangeL: 8, RangeR: 88)
              insertionSort(arr: &arr, n: arr.count)
          }
      }
      
      //10000个数据消耗 3.13s 20000个数消耗 12.4s
      func testInsertionSortWithNoSwapPerformance(){
          self.measure{
              var arr: [Int] = generateRandomData(n: 100000, RangeL: 8, RangeR: 88)
              for i in 0..<100000{
                  arr[i] = i+1
              }
              insertionSortwithNoSwap(arr: &arr, n: arr.count)
          }
      }
      
      //10000个数据消耗 12.2s，20000个消耗49.1s
      func testBubbleSortPerformance(){
          self.measure{
              var arr: [Int] = generateRandomData(n: 1000, RangeL: 8, RangeR: 88)
              bubbleSort(arr: &arr, n: arr.count)
          }
      }
      
      //10000个数据是0.102s 20000个是0.202s ；100000个 1.09s；200000个2.3s；1000000个 12.8s   O(nlog2n) 好的情况是O(n)
      func testShellSortPerformance(){
          self.measure{
              var arr: [Int] = generateRandomData(n: 1000000, RangeL: 8, RangeR: 88)
              shellSort(arr: &arr, n: arr.count)
          }
      }
      
      //20000个是0.195s 100000个 1.05s；200000个2.23s；1000000个 12.5s
      //对于一个原本正确序的数组，插值排序要快于希尔排序；因为希尔排序多进行了几步step步长的排序，最后才是步长为1的排序；
      //而插值排序直接就是步长为1的排序，只需n-1次比较就可
      func testShellSort2Performance(){
          self.measure{
              var arr: [Int] = generateRandomData(n: 100000, RangeL: 8, RangeR: 88)
              /*
              for i in 0..<100000{
                  arr[i] = i+1
              }
               */
              shellSort2(arr: &arr, n: arr.count)
          }
      }

    

}
