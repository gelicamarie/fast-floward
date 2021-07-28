/*
    Create a Collection resource for our Artist contract that will allow accounts to store their 
    Picture resources once they're printed. 
    Line 66 - 81
 */
pub contract Artist {

  pub struct Canvas {

    pub let width: UInt8
    pub let height: UInt8
    pub let pixels: String

    init(width: UInt8, height: UInt8, pixels: String) {
      self.width = width
      self.height = height
      self.pixels = pixels
    }
  }

  pub resource Picture {

    pub let canvas: Canvas
    
    init(canvas: Canvas) {
      self.canvas = canvas
    }
  }

  pub resource Printer {

    pub let width: UInt8
    pub let height: UInt8
    pub let prints: {String: Canvas}

    init(width: UInt8, height: UInt8) {
      self.width = width;
      self.height = height;
      self.prints = {}
    }

    pub fun print(canvas: Canvas): @Picture? {
      // Canvas needs to fit Printer's dimensions.
      if canvas.pixels.length != Int(self.width * self.height) {
        return nil
      }

      // Canvas can only use visible ASCII characters.
      for symbol in canvas.pixels.utf8 {
        if symbol < 32 || symbol > 126 {
          return nil
        }
      }

      // Printer is only allowed to print unique canvases.
      if self.prints.containsKey(canvas.pixels) == false {
        let picture <- create Picture(canvas: canvas)
        self.prints[canvas.pixels] = canvas

        return <- picture
      } else {
        return nil
      }
    }
  }

  pub resource Collection {
      //using an array to store the picture
      pub let pictureCollection: @[Picture]

      init(){
          self.pictureCollection <-[]
      }

      pub fun deposit(picture: @Picture){
          self.pictureCollection.append(<-picture)
      }

      destroy(){
        destroy self.pictureCollection
      }
  }

  pub fun createCollection(): @Collection{
    return <- create Collection()
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
      

    self.account.save(
      <- create self.createCollection(),
      to:/storage/ArtistPictureCollection
      )

    self.account.link<&Collection>(
        /public/ArtistPictureCollection,
        target: /storage/ArtistPictureCollection
      )
      }

 
    
}