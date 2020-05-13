//
//  QuickSort.swift
//  CaculatorSwiftDemo
//  快速排序
//  Created by 赵丹 on 2020/5/12.
//  Copyright © 2020 赵丹. All rights reserved.
//

import Foundation

/**
 快速排序
 */
func quickSort<T: Comparable>(arr: inout [T], n: Int) -> Void{
    quickSortCycle(arr: &arr, left: 0, right: n - 1)
}

func quickSortCycle<T: Comparable>(arr: inout [T], left: Int, right: Int) ->Void{
    if left >= right{
        return
    }
    
    let va = quickSortSearchV(arr: &arr, left: left, right: right)
    quickSortCycle(arr: &arr, left: left, right: va - 1)
    quickSortCycle(arr: &arr, left: va + 1, right: right)
}


func quickSortSearchV<T: Comparable>(arr: inout [T], left: Int, right: Int) -> Int{
  
    let v = arr[left]
    var j = left
    for i in left+1 ... right{
        if arr[i] < v{
            arr.swapAt(j + 1, i)
            j += 1
        }
    }
    arr.swapAt(left, j)
    return j
}
