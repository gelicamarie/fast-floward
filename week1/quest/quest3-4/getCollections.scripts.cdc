/*
Write a script that prints the contents of collections for all five Playground accounts (0x01, 0x02, etc.). 
 */
import Artist from 0x01

pub fun display(canvas: Artist.Canvas)  {
   let topBottom: String = "+-----+"
   let width = Int(canvas.width)
   let height = Int(canvas.height) - 1
   var counter: Int = 0; 
   log(topBottom)

    while(counter <= height){
        let fr = counter * width
        let to = counter == 0 ? width : fr + width
        let sides = "|".concat(canvas.pixels.slice(from: fr, upTo: to)).concat("|")
        log(sides)
        counter = counter + 1
    }
   log(topBottom)
}

pub fun main(){

  let accounts: [Address] = [0x01,0x02,0x03,0x04,0x05] 
   
   for account in accounts {
      let pictureCollection = getAccount(account)
      .getCapability<&Artist.Collection>(/public/PicturesCollection)
      .borrow() ?? panic(account.toString().concat(" has no picture collection!"))


      if pictureCollection!=nil{
      var counter = 0
         while counter < pictureCollection.pictureCollection.length {
            display(canvas: pictureCollection.pictureCollection[counter].canvas)
            counter = counter + 1
         }
      }
    
   } 
 

}
