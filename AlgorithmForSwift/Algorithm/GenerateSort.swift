//
//  OverrideCaculator.swift
//  CaculatorSwiftDemo
//  汇集各种O(n^2)算法
//  Created by 赵丹 on 2020/5/9.
//  Copyright © 2020 赵丹. All rights reserved.
//

import Foundation

//选择排序 ----O(n^2) ;
func selectionSort<T: Comparable>( arr: inout [T], n: Int) -> Void {
    
    for i in 0..<n{
        var minIndex = i
        for j in i..<n{
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
        }
//        arr.swapAt(i, minIndex)
        if minIndex != i {
            let tem = arr[i]
            arr[i] = arr[minIndex]
            arr[minIndex] = tem
        }
       
    }
}

/**
 最差的时间复杂度为O(n^2)
 插入排序对近乎有序的数组进行排序，性能很好，甚至比nlog(N)还要好;
 对于一个完全有序的数组时，它的算法复杂度为O(n)
 */
//插入排序
func insertionSort<T: Comparable>(arr: inout [T], n: Int) -> Void{
    for i in 1..<n{
        for j in stride(from: i, to: 0, by: -1) where arr[j] < arr[j - 1]{
            arr.swapAt(j, j - 1)
        }
    }
}

//插入排序不交换
func insertionSortwithNoSwap<T: Comparable>(arr: inout [T], n: Int) -> Void{
    for i in 1..<n{
        let res = arr[i]
        var j = i
        while (j > 0 && (res < arr[j - 1])) {
            arr[j] = arr[j - 1]
            j -= 1
        }
        arr[j] = res
    }
}

//冒泡排序 最差的时间复杂度为O(n^2);
//最优的时间复杂度为O(n),需要加flag，一次内存环中没有任何两个元素错位，则证明数组的顺序原本就是正确的排序，此时只需要比较n-1次
func bubbleSort<T: Comparable>(arr: inout [T], n: Int) -> Void {
    var flag = 1
    for i in 0..<n-1{
        //每一个内层循环都将最小值排到了最前面，时间复杂度 o(n^2)
        for j in stride(from: n - 1, to: i, by: -1){
            let tem = arr[j]
            if arr[j] < arr[j - 1] {
                arr[j] = arr[j - 1]
                arr[j - 1] = tem
            }
            flag = 0
        }
        
        if flag == 1 {
            break
        }
    }
}


//希尔排序(按照 step的步长分几组数组，进行插值排序；之后步长等比缩短，最后步长为一；这样使得一个数据原本一步一步前移，变成了step步的前移，节省时间)
func shellSort<T: Comparable>(arr: inout [T], n: Int) -> Void {
    var step = n/2
    
    while step > 0 {
        for i in step..<n{
            
            var j = i-step
            while j >= 0 &&  arr[j] > arr[j + step]{
                let tem = arr[j]
                arr[j] = arr[j + step]
                arr[j + step] = tem

                j -= step;
            }
        }
        step /= 2
    }
    
}

//简化希尔算法
func shellSort2<T: Comparable>(arr: inout [T], n: Int) -> Void{
    var step = n/2
    while step > 0 {
        for i in step..<n {
            var j = i
            let tem = arr[j]
            while j >= step && tem < arr[j - step] {
                arr[j] = arr[j - step]
                j -= step
            }
            arr[j] = tem
        }
        step /= 2
    }
}
