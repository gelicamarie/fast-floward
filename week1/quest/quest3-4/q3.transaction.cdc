/*
Flow Playground transaction test
 */
import Artist from "./artist.contract.cdc"

transaction() {
let pixels: String
//let picture: @Artist.Picture?
prepare(account: AuthAccount) {
    let printerRef = account
      .getCapability<&Artist.Printer>(/public/ArtistPicturePrinter)
      .borrow()
      ?? panic("Couldn't borrow printer reference.")
    

    self.pixels="*   * * *   *   * * *   *"
      let canvas= Artist.Canvas(
          width: printerRef.width,
          height: printerRef.height,
          pixels:self.pixels
      )

    //self.picture <- printerRef.print(canvas: canvas)
  
    let canvas2= Artist.Canvas(
        width: printerRef.width,
        height: printerRef.height,
        pixels:"******   **   **   ******"
    )


    let collectionRef= account
      .getCapability<&Artist.Collection>(/public/PicturesCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference.")

    
    collectionRef.deposit(picture: <- printerRef.print(canvas: canvas)!)
    collectionRef.deposit(picture: <- printerRef.print(canvas: canvas2)!)

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