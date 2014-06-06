Gravity Balls
=============

This application is a quick test for Apple's new Swift programming language. You will need Xcode 6 beta to run it.

###What I learned
After a couple of hours doing development with Swift, I managed to put together a very basic app using the UIGravityBehavior and other nice stuff from UIKit Dynamics, like collision detection. In the process, I learned a few interesting things about Swift:

* Swift is really cool, easy to write. It reminds me of Ruby and Scala (specially the `->` syntax to define function types)
* Casting, casting, casting. Apparently Swift infers the type so you do not have to indicate the type of each variable or constant. The problem is that Swift does not do any automatic casting, which means a lot of castings are needed to convert `Int` to `CGFloat` or even `CDouble` to `CGFloat`, etc.
* Callbacks (blocks) are easier to use than before. You can detach the callback block from the function parameters even on C methods like `dispatch_async()`, which improves the code clarity.
* Creating new objects is super clean. No more `alloc` + `init`. Not even the `new` keyword is needed (eg. `var motionManager = CMMotionManager()`).
* Working with nullable variables is a bit tricky at first, though much easier than Scala. Adding a question mark (`?`) to the variable automatically checks for `nil` and discards the rest of the expression if that is the value. Adding `!` indicates the compiler to assume that the variable will have a value at that point.
* Constants with computed variables are really cool, though I liked the Scala `val` keyword better than `let`. Anyhow, it is cool to be able to declare constants (inmutable variables) that are the result of a computed expression at runtime.
* I'm not sure when it is required to name the parameters when calling a function. Seems like sometimes it is, specially on constructors. Might be that the only time they are required? (eg. `view.backgroundColor = UIColor(red: 0.9, green: 0.88, blue: 0.8, alpha: 1)`)

![Gravity Balls](http://cl.ly/image/1C2X280k0N3p/Image%202014-06-07%20at%201.04.50%20AM.png)
