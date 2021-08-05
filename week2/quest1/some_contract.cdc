access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {
        // 4 Variables
        //
        pub(set) var a: String //read all, write all

        pub var b: String //read all, write current and inner

        /*
        read current, inner and containing contract
        write current and inner */
        access(contract) var c: String 

        /*
        read current, inner
        write current and inner */
        access(self) var d: String
    
        // 3 Functions
        //
        /*
           Access Scope : All 
         */
        pub fun publicFunc() {}
        
         /*
           Access Scope : Current and Inner 
         */
        access(self) fun privateFunc() {}

        /*
           Access Scope : Current, Inner, and other contracts in the same account
         */
        access(contract) fun contractFunc() {}


        pub fun structFunc() {
            // Area 1
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        //read all, write current and inner
        pub var e: Int

        pub fun resourceFunc() {
            // Area 2
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        // Area 3
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
