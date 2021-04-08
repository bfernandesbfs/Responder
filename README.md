# Responder

Responder is a Package that provides a way of sending your data through a chain of responsibility using a better protocol implementation based on delegate pattern and a better solution that the Notification Center provides

## How to use this package?

It's very simple, at first, we just implement `Responder` protocol where we want to create a linked list based on value type or reference, take a look at the example below:

```swift

struct Object: Responder {
    var nextResponder: Responder?
}

```

![alt text](./Docs/Img/Img01.png)

## Why do we want to do this?

Basically, we want to send data through this list and we need anyone to anwser whether or not they can perform this action. And how can we do this? The idea beyond this implementation is to have a fusion of delegate pattern and Notification Center using Chain of Responsibility

![alt text](./Docs/Img/Img02.png)

Following this example, we need to walk each object and wonder if we can execute or not execute an action if not then we wonder to next into the chain 

```swift

protocol ActionProtocol {
    func send(event: Action)
}

enum Action: Event {
    case here

    func sendToHandler(_ handler: ActionProtocol) {
        handler.send(event: self)
    }
}

```

In this case, the protocol `Action Protocol` is just only used as a protocol of validation who will be executed whether has found on chain. An `Event` is the protocol that we need to implement and who we'll send through the chain, easy easy right!

## How do we send an event?

Don't worry, it's much simpler than you imagine!

```swift

object.tryToHandle(Action.here)

```

Do you see? it's simple


## Ideas of usage

### Coordinator pattern

We can use this to avoid using delegate pattern in which usually we create a property reference to set delegate's values to each coordinator node

### Interceptor pattern

Here the use is basic, we can create a linked list and each element can respond a specific action

## How to install it?

### Swift Package Manager

To use `Responder` as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift

.package(url: "https://github.com/bfernandesbfs/Responder.git", .upToNextMajor(from: "0.0.1"))

```
## License

[Here](./LICENSE)
