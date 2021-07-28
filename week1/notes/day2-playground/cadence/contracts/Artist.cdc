pub contract Artist {
  pub struct Canvas {
      pub let width: UInt8
      pub let height: UInt8
      pub let pixels: String

      init(width: UInt8, height: UInt8, pixels: String){
          self.width = width
          self.height=height
          self.pixels = pixels
      }
  }

  pub resource Picture{
      pub let canvas : Canvas

      init(canvas: Canvas) {
          self.canvas = canvas
      }
  }

  pub resource Printer{
      pub let width: UInt8
    pub let height:UInt8
    pub var pixelCollection:[String];
      
      init(width: UInt8, height: UInt8){
          self.width = width;
          self.height=height;
          self.pixelCollection=[];
      }
      pub fun print(canvas: Canvas) : @Picture? {
          //day 2 Given Code 
          //checks if canvas fits
          if canvas.pixels.length != Int(self.width * self.height){
              return nil
          }
          //checks that canvas only uses visible ASCII chars
          for symbol in canvas.pixels.utf8 {
              if symbol < 32 || symbol > 126{
                  return nil
              }
          }

          if self.pixelCollection.contains(canvas.pixels) {
              return nil
          }

          self.pixelCollection.append(canvas.pixels)
          return <- create Picture(canvas: canvas)
      }
  }

  init(){
    self.account.save(
      <- create Printer(width:5, height:5),
      to:/storage/ArtistPicturePrinter
      )

      self.account.link<&Printer>(
        /public/ArtistPicturePrinter,
        target: /storage/ArtistPicturePrinter
      )

      /*let printRef = getAccount(0x01)
        .getCapability<&Artist.Printer>(/public/ArtistPicturePrinter)
        .borrow()
        ?? panic("Could not borrow reference to Printer")

        //Now printRef has access to every field and function fo the underlying Printer resource
        printRef.print() */
    // let name ="Morgan"
    // let nameRef: &String = &name as &String
      }
}