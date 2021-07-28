/*
Referenced cli testing from : https://github.com/maggo/fast-floward/tree/main/W1Q3
*/
import Artist from "./artist.contract.cdc"
transaction(pixels: String) {
//let pixels: String
//let picture: @Artist.Picture?
prepare(account: AuthAccount) {
    let printerRef = account
      .getCapability<&Artist.Printer>(/public/ArtistPicturePrinter)
      .borrow()
      ?? panic("Couldn't borrow printer reference.")
    
      let canvas= Artist.Canvas(
          width: printerRef.width,
          height: printerRef.height,
          pixels: pixels
      )

    let collectionRef= account
      .getCapability<&Artist.Collection>(/public/PicturesCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference.")

    
    collectionRef.deposit(picture: <- printerRef.print(canvas: canvas)!)

  }

  execute{
    // if(self.picture == nil) {
    //     log("Picture already exists...")
    // } else {
    //     log("Picture Printed!")
    // }

    // destroy self.picture
    log("Test: Transaction Succcessful")
  }
}