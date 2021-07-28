pub contract Hello {
    pub fun sayHi(to name: String) {
        log("Hello, ".concat(name))
        }
}