import chisel3._
import chisel3.util._  
import config.Configs._

class Axi4LiteIO extends Bundle{
  val master=Flipped(new Axi4LiteBundle())
  val slave=new Axi4LiteBundle()
}


class Axi4LiteBundle extends Bundle{
  val aw=Decoupled(new AxiAddressBundle())
  val w=Decoupled(new AxiWriteDataBundle())
  val b=Flipped(Decoupled(new AxiWriteResponseBundle()))
  val ar=Decoupled(new AxiAddressBundle())
  val r=Flipped(Decoupled(new AxiReadDataBundle()))
}

class AxiWriteDataBundle extends Bundle {
  val data = UInt(DATA_WIDTH.W)
  val wstrb = UInt((DATA_WIDTH/4).W)
}

class AxiWriteResponseBundle  extends Bundle{
  val resp = UInt(2.W)
}

class AxiAddressBundle extends Bundle {
  val addr = UInt(ADDR_WIDTH.W)
  val prot = UInt(3.W)
}

class AxiReadDataBundle extends Bundle {
  val data = UInt(DATA_WIDTH.W)
  val resp = UInt(2.W)
}

