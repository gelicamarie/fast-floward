/*
W1Q7 - What you got?
 */
import Artist from "./contract.cdc"

// Return an array of formatted Pictures that exist in the account with the a specific address.
// Return nil if that account doesn't have a Picture Collection.

//Quest 1 code
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


pub fun main(address: Address): [String]? {
    let CollectionRef = getAccount(address)
    .getCapability<&Artist.Collection>(/public/ArtistPictureCollection)
    .borrow()
    ?? panic("Couldn't borrow Collection Ref")


    if CollectionRef.getCanvases() == nil {
        return nil
    }

    var Collections : [String] = []
    for canvas in CollectionRef!.getCanvases(){
        Collections.append(canvas.pixels)
        display(canvas)
    }

    return Collections
    
}