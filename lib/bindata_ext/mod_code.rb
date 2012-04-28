class ModCode < BinData::Record
  endian  :little

  uint32  :mod_code
  uint32  :mod_param1
  uint32  :mod_param2
  uint32  :mod_param3
  uint32  :mod_offset
  uint32  :mod_length

  # Returns: nil if mod_code is 0xFFFFFFFF, mod_code otherwise
  def id
    self.mod_code == 0xFFFFFFFF ? nil : self.mod_code
  end

  # HACK: to get access to file_size && co
  def base
    parent.parent.parent
  end

  # Index within variable data
  def index
    (mod_offset - base.data_num_bytes - base.data_offset) / 4
  end

  # n item from variable_content
  def count
    mod_length / 4
  end

  # Variable content
  def data
    base.variable_content[index, count]
  end
end

