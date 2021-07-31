pub contract Hello {
  //evenrs -> when certain things happen
  pub event IssuedGreeting(greeting: String)

  pub fun sayHi(to name: String): String {
    let greeting = "Hi, ".concat(name)

   emit IssuedGreeting(greeting: greeting) //scripts dont support events

    //not logging -> logging only works on flow playground and flow shel;
    return greeting
  }
}