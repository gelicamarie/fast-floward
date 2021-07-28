import Hello from 0x01

transaction {
    let name: String

    prepare(account: AuthAccount){
        self.name = account.address.toString()
    }

    execute {
        Hello.sayHi(to: self.name)
    }
}