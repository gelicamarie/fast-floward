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
   pub var pixelCollection:[String];
    
    init(){
        self.pixelCollection=[];
    }
    pub fun print(canvas: Canvas) : @Picture? {
        if self.pixelCollection.contains(canvas.pixels) {
            log("This picture has already been printed.")
            return nil
        }

        display(canvas: canvas)
        self.pixelCollection.append(canvas.pixels)
        return <- create Picture(canvas: canvas)
    }
}

pub fun serializeStrArr(_ lines: [String]) : String {
    var buffer = ""

    for line in lines{
        buffer = buffer.concat(line)
    }
    return buffer
}

pub fun display(canvas: Canvas)  {
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

// [0 1 2 3 4 5(.) 6 7 8 9 10 11(.) 12 13 14 15 16 17(.) 18 19 20 21 22 ]
//
// "+-----+"  
// "|*   *|"   
// "| * * |"
// "|  *  |"
// "| * * |"
// "|*   *|"
// "+-----+"

}


pub fun main(){
    let pixelsX=[
      "*...*",
      ".*.*.",
      "..*..",
      ".*.*.",
      "*...*"  
    ]
    let pixelsU=[
      "*...*",
      "*...*",
      "*...*",
      "*...*",
      ".***."  
    ]

    let canvasX = Canvas(
        width: 5,
        height: 5,
        pixels: serializeStrArr(pixelsX)
    )

    let canvasY = Canvas(
        width: 5,
        height: 5,
        pixels: serializeStrArr(pixelsU)
    )

    /*
        Test : result 1 and 3 should print, and result 2 should log a message
     */
    let printer <- create Printer()
    let result1 <- printer.print(canvas: canvasX)
    let result2 <- printer.print(canvas : canvasX)
     let result3 <- printer.print(canvas : canvasY)
    destroy printer
    destroy result1
    destroy result2
    destroy result3

}