# Common

## **Framework vs Library**

- **Framework** → A set of Legos, each with its own purpose
    - Developers work according to pre-established rules (framework).
    - Creating an application with Xcode means building an app according to the framework Apple has provided.
- **Library** → Using pre-made, necessary parts created by others
    - It's like using a nice custom button made by someone else when making an app.

<br>

## **Object-Oriented Programming**

Why do we need **object-oriented programming**?

Think about a book management program or a member management program. Each program will have data it needs to use.

> **Member Data**

Name:
Gender:
Age:
Address:
>

> **Book Data**

Title:
Price:
Publisher:
Author:
>

If you design these member or book models well using classes or structures, you can use them like stamping bread in a factory, without having to create each one individually. This makes it easier to create and process data.

<br>

### Four Main Features of Object-Oriented Programming

1. **Abstraction**
    
    Similar to the term "modeling." In real life, abstraction means recombining only the parts the observer is interested in. In object-oriented terms, abstraction is the process of extracting common characteristics of entities and defining them as a class. (e.g., Book management program → title, author, publisher, price, etc.)
    
2. **Encapsulation**
    
    Encapsulation is the concept of grouping related states (properties) and behaviors (methods) into a single class. It also includes the idea of hiding, which allows you to control access to internal data from outside the object using access modifiers.
    
3. **Inheritance**
    
    Inheritance is the concept where a child class inherits the properties and methods of a parent class. Through inheritance, code can be reused, increasing productivity.
    
4. **Polymorphism**
    
    Polymorphism means that a single object can be stored in various types and can operate in various forms of methods. Therefore, one object can behave in many different ways.

<br>

## **Code, Data, Heap, Stack**

1. Code (Program) → All the code of the program
2. Data → Global variables and type variables, data shared in common
3. Heap → Dynamically allocated, large, and data that needs to be managed
4. Stack → Temporary space for function execution

<br>

## **Problems in Concurrent Programming**

1. **Race Condition**

In a multi-threaded environment, this is the problem where multiple threads access the same memory at the same time. In other words, it is not thread-safe. To solve this, you need to make the memory thread-safe so that other threads cannot access it while one thread is using it.

<br>

2. **Deadlock**

In a multi-threaded environment, this is the problem where work cannot proceed due to exclusive memory usage. Deadlock occurs when thread-safe handling is done, but due to poor design, threads block each other or try to occupy resources, preventing methods from finishing.