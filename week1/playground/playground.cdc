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

/*


 */
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
    destroy letterX
}