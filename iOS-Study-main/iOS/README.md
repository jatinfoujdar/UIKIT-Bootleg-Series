# iOS

## **Shortcuts**

- `control` + `I`:  Auto-indent
- `command` + `shift` + `y`: Toggle console up/down

<br>

## **import Foundation?**

- Provides features related to the Objective-C language.
- Provides collections like `NSArray`, `NSMutableArray`, `NSDictionary`, `NSSet`.
- Provides data and date-related types like `NSData`, `NSDate`.
- No need to memorize!

<br>

## **Constructor Delegation Rules in Inheritance**

1. **Delegate Up**
    
    The designated initializer of a subclass must call the designated initializer of its superclass.

<br>

2. **Delegate Across**
    
    A convenience initializer must call another initializer (either a convenience or designated initializer) within the same class, and ultimately must call a designated initializer.

<br>

## **Protocol-Oriented Programming**

Apple was the first to propose the protocol-oriented programming paradigm.

<br>

**Disadvantages of Classes and Inheritance**

- Only one class can be inherited.
- Subclasses must follow the memory structure of the superclass.
- Only classes can use inheritance.

<br>

**But with protocol-oriented programming?**

- Multiple protocols can be adopted. → This allows for better composition and reusability.
- No specific memory structure requirements. → You can adopt only the properties/methods you need.
- Can be adopted by any type. → Increases versatility.

<br>

## **Method Dispatch**

There are three ways Swift executes functions.

1. **Direct Dispatch**
    
    At compile time, the function's memory address is inserted directly into the code, or the function's instructions are embedded at that location. This is the fastest method, but is used for value types like structs and enums, so you can't take advantage of inheritance and polymorphism.

<br>

2. **Table Dispatch**
    
    The function pointer is stored in an array and executed from there. This is the second fastest method and is used for classes and protocols. Classes use a Virtual Table, and protocols use a Witness Table.

<br>

3. **Message Dispatch**
    
    The method to execute is determined by traversing the inheritance hierarchy. This is the slowest method and is mainly used in Objective-C classes.

<br>

## **ARC: Automatic Reference Counting**

ARC is Swift's memory management model. It stands for Automatic Reference Counting, which automatically counts the number of references to memory. If we had to manage memory manually, we would write code like this:

```swift
class Point {
	var refCount: Int           // Variable to count references
	var x, y: Double
	func draw() { ... }
}

let point1 = Point(x: 0, y: 0) // +1, refCount = 1
let point2 = point1 
retain(point2)                 // +1, refCount = 2

point2.x = 5

release(point1)                // -1, refCount = 1
release(point2)                // -1, refCount = 0 -> Memory deallocated
```

`retain()` → Increases the reference count by one.

`release()` →  Decreases the reference count by one.

Therefore, when the reference count becomes 0, the memory is deallocated. With ARC in Swift, we don't have to worry about `retain` and `release` as it is handled automatically at compile time.

<br>

## **Strong Reference Cycle**

A strong reference cycle occurs when two objects reference each other, causing a memory leak because the memory cannot be deallocated and there is no way to release it.

```swift
class Dog {
	var name: String
	var owner: Person?

	init(name: String) {
		self.name = name
	}

	deinit { // Destructor
		print("\(name) memory deallocated")
	}
}

class Person {
	var name: String
	var pet: Dog?
	
	init(name: String) {
		self.name = name
	}

	deinit {
		print("\(name) memory deallocated")
	}
}

var bori: Dog? = Dog(name: "Bori")
var gildong: Person? = Person(name: "Gildong")

bori?.owner = gildong
gildong?.pet = bori
// --> Strong reference cycle occurs

bori = nil    // Memory cannot be deallocated
gildong = nil // Memory cannot be deallocated
```

In the code above, "Bori"'s owner is "Gildong" and "Gildong"'s pet is "Bori", so the two objects reference each other, causing a memory leak.

<br>

**Two Solutions to Memory Leaks**

Both solutions prevent the reference count from increasing.

1. **Weak Reference**
    
    Simply use the `weak` keyword in front.
    
    ```swift
    class Dog {
    	var name: String
    	weak var owner: Person?
    
    	init(name: String) {
    		self.name = name
    	}
    
    	deinit { // Destructor
    		print("\(name) memory deallocated")
    	}
    }
    
    class Person {
    	var name: String
    	weak var pet: Dog?
    	
    	init(name: String) {
    		self.name = name
    	}
    
    	deinit {
    		print("\(name) memory deallocated")
    	}
    }
    
    var bori: Dog? = Dog(name: "Bori")
    var gildong: Person? = Person(name: "Gildong")
    
    // No strong reference cycle
    bori?.owner = gildong
    gildong?.pet = bori
    
    bori = nil    // print("Bori memory deallocated")
    gildong = nil // print("Gildong memory deallocated")
    ```
    
    In the case of a weak reference, if the instance being referenced disappears, it is automatically set to `nil`. Because it can be set to `nil`, you cannot use `weak let` or declare it as Non-Optional. Therefore, it is mainly used when referencing instances with a shorter lifecycle than the owner.

<br>

2. **Unowned Reference**
    
    Like a weak reference, simply use the `unowned` keyword in front.
    
    ```swift
    class Dog {
    	var name: String
    	unowned var owner: Person?
    
    	init(name: String) {
    		self.name = name
    	}
    
    	deinit { // Destructor
    		print("\(name) memory deallocated")
    	}
    }
    
    class Person {
    	var name: String
    	unowned var pet: Dog?
    	
    	init(name: String) {
    		self.name = name
    	}
    
    	deinit {
    		print("\(name) memory deallocated")
    	}
    }
    
    var bori: Dog? = Dog(name: "Bori")
    var gildong: Person? = Person(name: "Gildong")
    
    // No strong reference cycle
    bori?.owner = gildong
    gildong?.pet = bori
    
    bori = nil    // print("Bori memory deallocated")
    gildong = nil // print("Gildong memory deallocated")
    ```
    
    Unlike a weak reference, an unowned reference is not set to `nil` when the referenced instance disappears. Therefore, it is used when the instance has a longer or equal lifecycle compared to the owner.
    
    As seen in the examples above, since there are more considerations when using `unowned`, in practice, the `weak` keyword is more commonly used for weak references in projects.


<br>


## **Life Cycle**

- `viewDidLoad` - The point at which the view is connected to the storyboard
- `viewWillAppear` - Called before the view appears on the screen
- `viewDidAppear` - Called after the view appears on the screen
- `viewWillDisappear` - Called before the view disappears from the screen
- `viewDidDisappear` - Called after the view disappears from the screen