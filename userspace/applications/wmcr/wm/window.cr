class Wm::Window

  @bitmap_file : File
  @bitmap : UInt32*
  getter x, y, width, height

  def initialize(@wid : Int32, @client : Wm::Client,
                 @x : Int32 = 0, @y : Int32 = 0,
                 @width : Int32 = 0, @height : Int32 = 0)
    @bitmap_file = File.new("/tmp/wm-bm:" + @wid.to_s, "w").not_nil!
    @bitmap = Pointer(UInt32).null
  end

  def bitmap
    if @bitmap.null?
      @bitmap = @bitmap_file.map_to_memory.as(UInt32*)
    end
    @bitmap
  end

end
