//
//  HeapSort.swift
//  AlgorithmForSwift
//  堆排序
//  Created by 赵丹 on 2020/5/14.
//  Copyright © 2020 赵丹. All rights reserved.
//

import Foundation
/**
 堆可用于优先队列
 堆在入队的时间复杂度上比普通数组慢；
 在出队列时比顺序数组慢；
 时间复杂度稳定在：O(logn)
 队列用数组时间复杂度最差在：O(n^2)
 */


//二叉堆满足条件（1.完全二叉树 2.堆中的某个节点的值总是不大于父节点值）即最大堆（顶部节点最大）

class MaxHeap<Item: Comparable>{
    
    private var data: [Item]!
    private var count: Int
    private var capacity: Int!
    
    
    private func shiftUp(k: Int) -> Void{
        var ck = k
        while (data[ck / 2] < data[ck] && ck > 1){
            data.swapAt(ck, ck/2)
            ck /= 2
        }
    }
    
    private func shiftDown(k: Int) -> Void{
            var ck = k
            //有左节点
            while 2*ck <= count {
                //这里一定注意，ck循环多次后与k值已经不同，下面不要使用错了
                var j = 2*ck
                if j + 1 <= count && data[j] < data[j + 1]{
                    j += 1
                }
                if data[ck] >= data[j] {
                    break
                }
                data.swapAt(ck, j)
                ck = j
            }
    }

    public init(capacity: Int, item: Item){
        self.capacity = capacity
        self.count = 0
        self.data = Array(repeating: item, count: capacity) 
//        self.data = [Item](repeating: Item().self, count: self.capacity)
    }
    
    
    public init(arr: [Item], n: Int){
        self.data = Array(repeating: arr[0], count: n + 1)
        capacity = n + 1
        for i in 0..<n{
            data[i + 1] = arr[i]
        }

        //此处上面for循环处理完才会处理下面
        count = n
        //先整成堆
        let fom = count/2
        for i in stride(from: fom, to: 0, by: -1){
            shiftDown(k: i)
        }
    }
    
    public
    
    var size: Int{
        return self.count
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    func insert(item: Item) -> Void {
        //判断容量
        assert(count + 1 <= capacity)
        //使得满足堆排序
        data[count + 1] = item
        count += 1
        shiftUp(k: count)
    }
    
    func export() -> Item {
        assert(count > 0)
        let item = data[1]
        data.swapAt(1, count)
        count -= 1
        shiftDown(k: 1)

        return item
    }
    
    func printHeap() -> Void {
        for i in 1...count{
            print(self.data[i], terminator:" ")
            if i == count{
                print("")
            }
        }
    }

}

func initHeap() -> Void{
    let heap = MaxHeap<Int>(capacity: 100, item: 0)
    print(heap.size)
    
    for _ in 0..<15{
        heap.insert(item: Int(arc4random() % UInt32(100)))
    }
    
//    heap.printHeap()
    
    if !heap.isEmpty(){
        let tem = heap.export()
        print(tem)
//        heap.printHeap()
    }
}


func heapSort<T: Comparable>(arr:inout [T], n: Int) -> Void{
    let maxHeap = MaxHeap<T>(capacity: n + 1, item: arr[0])

    for i in 0 ..< n{
        maxHeap.insert(item: arr[i])
    }
    
//    maxHeap.printHeap()

    
    for j in stride(from: n - 1, through: 0, by: -1){
        let tem = maxHeap.export()
        arr[j] = tem
    }
//    print(arr)
}

func heapifySort<T: Comparable>(arr: inout [T], n: Int) -> Void{
    let maxHeap = MaxHeap(arr: arr, n: n)
    /*
    //此种情况构造函数里面的循环未完成就开始了下面的循环，不合逻辑
    print("我开始了")
    for j in stride(from: n - 1, through: 0, by: -1){
        print("+++++++++++++++++++")
        print(arr)
        let tem = maxHeap.export()
        arr[j] = tem
    }
 */

    secondHeapifySort(arr: &arr, heap: maxHeap, n: n)
}


func secondHeapifySort<T: Comparable>(arr: inout [T], heap: MaxHeap<T>, n: Int) -> Void{
    //此种情况构造函数里面的循环未完成就开始了下面的循环，不合逻辑
    for j in stride(from: n - 1, through: 0, by: -1){
        let tem = heap.export()
        arr[j] = tem
    }
}
