//
//  main.swift
//  SortStack
//
//  Created by Emiko Clark on 11/18/17.
//  Copyright © 2017 Emiko Clark. All rights reserved.
//

import Foundation


class Node {
    var value: Int
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}
var minimumValue: Int?

class Stack {
    var top: Node?
    
    func push(_ stack: Stack, value: Int) {
        let oldTop = stack.top
        stack.top = Node(value: value)
        stack.top?.next = oldTop
    }
    
    func pop(_ stack: Stack) -> Int {
        let oldTop = stack.top
        stack.top = stack.top?.next
        return (oldTop?.value)!
    }
    
    func peek(stack: Stack) -> Int {
        return ((stack.top != nil) ? (stack.top?.value)! : 0 )
    }
    
    func isEmpty(stack: Stack) -> Bool {
        return (stack.top == nil) ? true : false
    }
    
    func printStack() {
        var output = "----------\n"
        var n = top
        
        while(n != nil && n?.next != nil) {
            output += "\(String(describing: (n?.value)!))\n"
            n = n?.next
        }
        output += "\(String(describing: (n?.value)!))"
        output += "\n----------\n"
        print(output)
    }
    
    func sortStack(stack s1: Stack) {
        let s2 = Stack()
        var nextNum = s1.pop(s1)
        
        while (!isEmpty(stack: s1)) {

            if (s2.top == nil) {
                s2.push(s2, value: nextNum)
                nextNum = s1.pop(s1)

            } else {

                if (nextNum < (s1.top?.value)! && nextNum < (s2.top?.value)! ) {
                    if (s1.top?.value)! < (s2.top?.value)! {
                        s1.push(s2, value: s1.pop(s1))
                    } else {
                        s2.push(s2, value: nextNum)
                        if nextNum < (s1.top?.value)! {
                            nextNum = s1.pop(s1)
                        }
                    }
                }
                    
                else if (nextNum > (s1.top?.value)! && (nextNum < (s2.top?.value)!) ) {
                    s2.push(s2, value: nextNum)
                    nextNum = s1.pop(s1)
                }
                
                else if (nextNum > (s1.top?.value)! && (nextNum > (s2.top?.value)!) ) {
                    if !s2.isEmpty(stack: s2) {
                        s2.push(s1, value: s2.pop(s2))
                    } else {
                        s2.push(s2, value: nextNum)
                    }
                }
                
                if (isEmpty(stack: s1)) {
                     if nextNum < (s2.top?.value)!  {
                        s2.push(s2, value: nextNum)
                    } else {
                        s1.push(s1, value: s2.pop(s2))
                    }
                }
            }
        }
        print("After sorting..")
        if s1.isEmpty(stack: s1) {
            print("S1 is empty")
        } else {
            print("S1")
            s1.printStack()
        }
        
        if s2.isEmpty(stack: s2) {
            print("S2 is empty")
        } else {
            print("\nS2 - sorted")
            s2.printStack()
        }
    }
}

let s1 = Stack()
    
s1.push(s1,value: 5)
s1.push(s1,value: 47)
s1.push(s1,value: 3)
s1.push(s1,value: 15)
s1.push(s1,value: 23)
s1.push(s1,value: 10)
s1.push(s1,value: 19)
s1.push(s1,value: 50)
s1.push(s1,value: 1)
s1.push(s1,value: 35)

print("S1")
s1.printStack()
print("S2 is empty\n")

s1.sortStack(stack: s1)



