require '../edgette_enum/EdgetteEnumerable'

class Triple
  include EdgetteEnumerable

  def initialize(a = nil, b = nil, c = nil)
    @list = [a, b, c]
  end

  def each(&block)
    @list.each(&block)
    self
  end

end