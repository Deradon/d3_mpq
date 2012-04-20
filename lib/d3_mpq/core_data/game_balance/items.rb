module D3MPQ::CoreData::GameBalance
  class Items < BinData::Record
    STRUCT_SIZE = 0x590

    endian :little
    hide   :numbers,
           :zero,
           :item_level_plus_one

    skip    :length => 0x120
    string  :excel_file_name, :length => 0x100
    uint32  :identifier
    array   :numbers, :type => :uint32, :read_until => lambda { element != 0 && element.offset < 0x370 }
    uint32  :data_size

    array   :type => :uint8, :read_until => lambda { element.offset + 0x01 == data_offset + 16  }

    # ItemArray here
    array :data_content, :initial_length => lambda { data_size / STRUCT_SIZE } do
      string :read_length => 0x04
      string :name, :read_length => 0x100, :trim_padding => true
      uint32 :item_identifier
      uint32 :ref1
      uint32 :item_type

      uint32 :check_value => lambda { value == 0x00 }
      uint32 :item_level_plus_one
      uint32 :check_value => lambda { value == 0x00 }
      uint32 :check_value => lambda { value == 0x00 }
      uint32 :u01
      uint32 :u02
      uint32 :u03
      uint32 :gold_value
      uint32 :item_level_plus_one_times_three
      uint32 :required_level
      uint32 :two_five_oh
      uint32 :two_oh_oh
      uint32 :ref2
      uint32 :u04
      uint32 :u05
      uint32 :u06
      uint32 :u07
      uint32 :u08
      uint32 :check_value => lambda { value == 0x00 }
      uint32 :u09 #town scroll etc.

      # 0x18 00000000 padding
      array :initial_length => 0x18 do
        uint32 :check_value => lambda { value == 0x00 }
      end

      float_le :damage_minimum
      float_le :damage_variable

      # Zeroes
      array :initial_length => 0x15 do
        uint32 :check_value => lambda { value == 0x00 }
      end

      float_le :armor_minimum
      float_le :armor_variable

      # Zeroes
      array :initial_length => 0x2A do
        uint32 :check_value => lambda { value == 0x00 }
      end

      float_le :speed

      # Zeroes
      array :initial_length => 0x28 do
        uint32 :check_value => lambda { value == 0x00 }
      end

      # TODO
      uint32   :u10
      uint32   :check_value => lambda { value == 0x00 }
      uint32   :check_value => lambda { value == 0xFFFFFFFF }
      uint32   :check_value => lambda { value == 0x00 }
      uint32   :check_value => lambda { value == 0xFFFFFFFF }
      uint32   :check_value => lambda { value == 0x00 }
      uint32   :check_value => lambda { value == 0xFFFFFFFF }
      uint32   :check_value => lambda { value == 0x00 }
      uint32   :check_value => lambda { value == 0x00 }
      uint32   :check_value => lambda { value == 0x00 }
      uint32   :check_value => lambda { value == 0x00 }
      uint32   :check_value => lambda { value == 0x00 }
      uint32   :check_value => lambda { value == 0x00 }

      string   :length => 0x1f0 - (0x04 * 13)
      uint32be :affix1_ref
      uint32be :affix2_ref
      uint32be :affix3_ref
      uint32be :affix4_ref
      uint32be :affix5_ref
      uint32   :check_value => lambda { value == 0xFFFFFFFF }
      uint32   :affix1_value
      uint32   :affix2_value
      uint32   :affix3_value
      uint32   :affix4_value
      uint32   :affix5_value
      uint32   :check_value => lambda { value == 0x00 }
    end



    rest    :rest

    def data_offset
      self.numbers.last
    end
  end
end

#def guess_struct_size(data_content, data_size)
#  start_size = 0x10
#  start_string = data_content[0,start_size]


#  divisors = data_size.divisors(4)
#  divisors.each do |struct_size|
#    struct_fits = false
#    (data_size / struct_size).times do |i|
#      struct_fits = data_content[struct_size*i+4 ,start_size] == start_string
#      break unless struct_fits
#    end
#    return struct_size if struct_fits
#  end
#  raise "NotFound"
#end



#  # Returns supposed data-field for given row
#  def guess_struct_types(data_content, data_size, struct_size)
#    item_count   = data_size / struct_size
#    column_count = struct_size / 4
#    fields       = Array.new(column_count)

#    column_count.times do |c|
#      fields[c] = analyze_column(c, data_content, struct_size, item_count)
#    end

#    return fields
#  end

#  def analyze_column(c, data_content, struct_size, item_count)
#    max_int         = 0
#    max_float       = 0.0
#    min_float       = 0.0
#    invalid_string  = false
#    not_zeroes      = false
#    not_ffs         = false

#    item_count.times do |i|
#      item_content = data_content[i*struct_size + c*4, 4]

#      current_int   = item_content.unpack("L")[0]
#      current_float = item_content.unpack("F")[0]

#      #invalid_string ||= !item_content.valid_encoding?
#      invalid_string ||= item_content[0].unpack("C")[0] > 0x7F
#      invalid_string ||= item_content[1].unpack("C")[0] > 0x7F
#      invalid_string ||= item_content[2].unpack("C")[0] > 0x7F
#      invalid_string ||= item_content[3].unpack("C")[0] > 0x7F

#      not_zeroes     ||= current_int != 0x00000000
#      not_ffs        ||= current_int != 0xFFFFFFFF

#      max_int   = current_int   if max_int   < current_int
#      max_float = current_float if max_float < current_float
#      min_float = current_float if min_float > current_float
#    end

#    return "ZEROES"   unless not_zeroes
#    return "FF"       unless not_ffs

#    return "INTEGER"  if max_int < 0x00FFFFFF
#    return "CHARS"    unless invalid_string

#    return "FLOAT"    if min_float > -1000.0 and max_float < 1000.0
#    return "REFERENCE"
#  end


#  def sum_up_raw_struct(raw_struct)
#    struct = []
#    raw_struct.each do |rs|
#      if struct.length > 0 and
#        (struct[struct.length - 1][:type] == rs || (struct[struct.length - 1][:type] == "CHARS" and rs == "ZEROES") ) and
#        (rs == "ZEROES" or rs == "FF" or rs == "CHARS")
#        struct[struct.length-1][:count] += 1
#      else
#        struct << {
#          :type  => rs,
#          :count => 1
#        }
#      end
#    end
#    return struct
#  end

#a = D3::CoreData::GameBalance::Items.new
#io = File.open("Input/CoreData/GameBalance/Items_Legendary.gam")
##path = "Input/CoreData/GameBalance/SocketedEffects.gam"
##path = "Input/CoreData/GameBalance"
#failed_files = []

##Dir.entries(path).sort.each do |file|
##  begin
##    if file != "." and file != ".." and !file.start_with?("Rec")
##      io = File.open(path + "/" + file)
##      a.read(io)
##      if a.data_size == 0
##        p "NUL"
##        break
##      end
##      p "#{a.data_content[0x14,0x04]} - #{file}"
##      #p "#{file}: #{guess_struct_size(a.data_content, a.data_size)} - #{a.rest.length}"
##      a.clear
##    end
##  rescue Exception => e
##    failed_files << file
##    next
##  end
##end


##io = File.open("Input/CoreData/GameBalance/SocketedEffects.gam")


##BinData::trace_reading do
#  a.read(io)
##end
##p a.data_offset
##p a.snapshot.inspect

#struct_size = guess_struct_size(a.data_content, a.data_size)

## TEMP
#struct_size = 0x590

#item_count = a.data_size / struct_size


#raw_struct = guess_struct_types(a.data_content, a.data_size, 0x590)
#struct = sum_up_raw_struct(raw_struct)

#keys    = []
#values  = []
#struct.each do |hsh|
#  keys   << hsh[:type] if hsh[:type] != "ZEROES" and hsh[:type] != "FF"
#  values << hsh[:count]*4 if hsh[:type] != "ZEROES" and hsh[:type] != "FF"
#end

#puts keys.join(";")
#puts values.join(";")



#item_count.times do |i|
#  res    = []
#  offset = 0

#  struct.each do |hsh|
#    read_from = i*struct_size + offset
#    sub_res = a.data_content[read_from, hsh[:count]*4]
#    case hsh[:type]
#      when "ZEROES"
#        #res << "00"
#      when "FF"
#        #res << "FF"
#      when "CHARS"
#        res << sub_res.unpack("A#{hsh[:count]*4}")[0].gsub("\n", "")
#      when "INTEGER"
#        res << sub_res.unpack("L")[0]
#      when "FLOAT"
#        res << sub_res.unpack("F")[0]
#      when "REFERENCE"
#        res << sub_res.unpack("H8")[0]
#    end
#    offset += hsh[:count] * 4
#  end
#  puts res.join(";")
#end

