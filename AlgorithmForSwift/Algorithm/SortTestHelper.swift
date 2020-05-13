//
//  SortTestHelper.swift
//  CaculatorSwiftDemo
//  测试用例
//  Created by 赵丹 on 2020/5/11.
//  Copyright © 2020 赵丹. All rights reserved.
//

import Foundation

//随机生成数组
func generateRandomData( n: Int, RangeL: Int, RangeR: Int ) -> Array<Int> {
    var randomArray = Array<Int>(repeating: 0, count: n)
    
    assert(RangeL <= RangeR, "RangeL 大于 RangeR")
    for i in 0..<n{
        //srand(UInt32(time(nil)))
        let data = Int(arc4random() % UInt32(RangeR - RangeL + 1)) + RangeL
        randomArray[i] = data
    }
    return randomArray
}

//测试sort函数执行所需时常
  /**
   输出打印结果
   selectSort : 10000 counts data need 24.544205904006958 s *10
   
   selectSort : 20000 counts data need 98.70421206951141 s*10

   selectSort : 30000 counts data need 219.771262049675 s*10

   selectSort : 40000 counts data need 390.4773509502411 s*10
   
   @result: 可以看出是指数级的增长
   */
  func testSortTime<T>( sortName: String, sort:( _ arr: inout [T], _ count: Int) -> Void , arr: inout [T], count: Int) -> Void {
  //    let startTime = clock()
      let startTime = CFAbsoluteTimeGetCurrent()
      sort(&arr, count)
  //    let endTime = clock()
      let endTime = CFAbsoluteTimeGetCurrent()
      print("\(sortName) : \(count) counts data need \(endTime - startTime) s")
  }
  






