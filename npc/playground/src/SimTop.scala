import chisel3._
import chisel3.util._

class SimTop extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val en = Input(Bool())
    val out = Output(UInt(3.W))
  })
  val encode = Module(new encode82())
  val seg = Module(new bcd7seg())
  encode.encode.in := io.in
  encode.encode.en := io.en

  seg.seg.in := encode.encode.out
  io.out := seg.seg.out

}

class encode82 extends Module {
  val encode = IO(new Bundle {
    val in = Input(UInt(8.W))
    val en = Input(Bool())
    val out = Output(UInt(3.W))
  })
  when(encode.en){
    encode.out:=0.U
    for(i<-0 until 8){
      when(encode.in(i)===1.U){
        encode.out:=i.U(3.W)
      }
    }
  }otherwise{
    encode.out := 0.U
  }
}

class bcd7seg extends Module{
  val seg = IO(new Bundle {
    val in = Input(UInt(3.W))
    val out= Output(UInt(7.W))
  })
  seg.out := MuxLookup(seg.in, 0.U)(Seq(
    0.U -> "b0000000".U, 1.U -> "b1111001".U, 
    2.U -> "b0100100".U, 3.U -> "b0110000".U,
    4.U -> "b0011001".U, 5.U -> "b0010010".U,
    6.U -> "b0000010".U, 7.U -> "b1111000".U, 
    8.U -> "b0000000".U, 9.U -> "b0010000".U
  ))
}