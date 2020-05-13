//
//  QuickSort.swift
//  CaculatorSwiftDemo
//  快速排序
//  Created by 赵丹 on 2020/5/12.
//  Copyright © 2020 赵丹. All rights reserved.
//

import Foundation

/**
 快速排序 nlogN（快速排序也是将原数组一分为二，这样形成了二叉树；不过这个二叉树的深度并不同于归并a排序一样为logN）;最差情况是只有左子树或只有右子树，时间复杂度为O(n^2)
 */
func quickSort<T: Comparable>(arr: inout [T], n: Int) -> Void{
    quickSortCycle(arr: &arr, left: 0, right: n - 1)
}


enum QuickSort{
    case SingleSort
    case DoubleSort
    case ThirdSort
}

func quickSortCycle<T: Comparable>(arr: inout [T], left: Int, right: Int) ->Void{
    if left >= right{
        return
    }
    
    let quickSort = QuickSort.ThirdSort
    var va:Int = 0
    switch quickSort {
    case .SingleSort:
        va = quickSortSearchV(arr: &arr, left: left, right: right)
        quickSortCycle(arr: &arr, left: left, right: va - 1)
        quickSortCycle(arr: &arr, left: va + 1, right: right)
    case.DoubleSort:
        va = doubleQuickSort(arr: &arr, left: left, right: right)
        quickSortCycle(arr: &arr, left: left, right: va - 1)
        quickSortCycle(arr: &arr, left: va + 1, right: right)
    default:
        ThreeQuickSort(arr: &arr, left: left, right: right)
    }

}


func quickSortSearchV<T: Comparable>(arr: inout [T], left: Int, right: Int) -> Int{
  
    //一、对于一个近乎有序的数组，以一个左节点，或是右节点为基准都不合适；此时需要添加一个随机节点；(将这个随机节点与左节点交换)
    //二：对于一个有大量重复数值的数组，这种比较依旧会退化到O(n^2);
    
    let randomIndex = Int(arc4random() % UInt32(right - left + 1)) + left
    arr.swapAt(left, randomIndex)
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


/**
 双路快排
 */
func doubleQuickSort<T: Comparable>(arr: inout [T], left: Int, right: Int) -> Int {
    
    let randomIndex = Int(arc4random() % UInt32(right - left + 1)) + left
    arr.swapAt(left, randomIndex)
    let v = arr[left]
    var i = left + 1
    var j = right
    while true {
        while (i <= right && arr[i] < v){
            i += 1
        }
        while (j >= left + 1 && arr[j] > v){
            j -= 1
        }
        
        if i > j {
            break
        }
        arr.swapAt(i, j)
        i += 1
        j -= 1
    }
    
    //最后j <= i
    arr.swapAt(left, j)
    return j
}


/**
 三路快排
 */
func ThreeQuickSort<T: Comparable>(arr: inout [T], left: Int, right: Int) -> Void {
    
    if left >= right {
        return
    }
    
    let randomIndex = Int(arc4random() % UInt32(right - left + 1)) + left
    arr.swapAt(left, randomIndex)
    
    //左路(存放< v)
    var lt = left
    //中路（存放=v）
    var i = left + 1
    //右路（存放>v）
    var gt = right + 1
    let v = arr[left]
    
    while i < gt {
        if arr[i] < v{
            arr.swapAt(lt + 1, i)
            lt += 1
            i += 1
            
        }else if( arr[i] > v){
            arr.swapAt(i, gt - 1)
            gt -= 1
            //记得此处i并不作变化（因为i左边索引没有向后推进）
        }else{
            i += 1
        }
    }
    
    arr.swapAt(left, lt)
    ThreeQuickSort(arr: &arr, left: left, right: lt - 1)
    ThreeQuickSort(arr: &arr, left: gt, right: right)
}

