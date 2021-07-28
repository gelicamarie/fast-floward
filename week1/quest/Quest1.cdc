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

    let canvasX = Canvas(
        width: 5,
        height: 5,
        pixels: serializeStrArr(pixelsX)
    )

    let letterX <- create Picture(canvas: canvasX)
    log(letterX.canvas)
    display(canvas: letterX.canvas)
    destroy letterX
}