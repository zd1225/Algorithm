//
//  AlgorithmSecond.swift
//  CaculatorSwiftDemo
//
//  Created by 赵丹 on 2020/5/12.
//  Copyright © 2020 赵丹. All rights reserved.
//

import Foundation

/**
 自顶向下
 */
//归并算法 O（nlogn）
func mergeSort<T: Comparable>(arr: inout [T], n:Int) -> Void{
    splitMergeSortArry(arr: &arr, left: 0, right: n-1)
}

func splitMergeSortArry<T: Comparable>(arr: inout [T], left: Int, right: Int) -> Void{
    if right <= left {
        return
    }
    
    //交叉排序
    if right - left <= 15 {
        insertionSortReduce(arr: &arr, left: left, right: right)
        return
    }
    
    let mid = (right + left)/2
    splitMergeSortArry(arr: &arr, left: left, right: mid)
    splitMergeSortArry(arr: &arr, left: mid+1, right: right)
    //加个判断，省去排序时间(否则是个已经有序的序列)
    if arr[mid] > arr[mid + 1]{//有可能是有序的
        startMerge(arr: &arr, left: left, mid: mid, right: right)
    }
}

//一次比较就可以选出一个有序的元素放前面
func startMerge<T: Comparable>(arr: inout [T], left: Int, mid: Int, right: Int) -> Void{
    if right - left <= 0 {
        return
    }
    let length = right - left + 1
    //定义一个范型数组
    var muta: [T] = Array(repeating: arr[0], count: length)
    var i = left, j = mid + 1;
    for k in left...right{
        muta[k - left] = arr[k]
    }
    
    for t in left...right {
        if i > mid {
            arr[t] = muta[j - left]
            j += 1
        }else if (j > right){
            arr[t] = muta[i - left]
            i += 1
        }else if(muta[i - left] < muta[j - left]){
            arr[t] = muta[i - left]
            i += 1
        }else{
            arr[t] = muta[j - left]
            j += 1
        }

    }
    
}


/**
 递归近乎到底的时候，有可能就是个有序的数组，所以用递归和插入结合的方式
 */
//插入排序不交换
func insertionSortReduce<T: Comparable>(arr: inout [T], left: Int, right: Int) -> Void{
    for i in left...right{
        let res = arr[i]
        var j = i
        while (j > 0 && (res < arr[j - 1])) {
            arr[j] = arr[j - 1]
            j -= 1
        }
        arr[j] = res
    }
}



/**
 自底向上
 */
func mergeSortDU<T: Comparable>(arr: inout [T], n:Int) -> Void{
    var size = 1
    while size <= n {
        var i = 0
        while i + size < n {
            startMerge(arr: &arr, left: i, mid: i + size - 1, right: min(i + size + size - 1, n - 1))
            i += (size + size)
        }
        size += size
    }
    
}

//链表排序


