import Artist from 0x02

transaction{
    let pixels: String
    let picture: @Artist.Picture?

    prepare(account: AuthAccount) {
        let printerRef = getAccount(0x02)
            .getCapability<&Artist.Printer>(/public/ArtistPicturePrinter)
            .borrow()
            ??panic("Error: Couldn't borrow printer reference")

        self.pixels="*   * * *   *   * * *   *"
        let canvas= Artist.Canvas(
            width: printerRef.width,
            height: printerRef.height,
            pixels:self.pixels
        )

        self.picture <- printerRef.print(canvas: canvas)
    }

    execute {
        if(self.picture == nil) {
            log("Picture already exists...")
        } else {
            log("Picture Printed!")
        }

        destroy self.picture
    }

}