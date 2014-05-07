class Move
  LIST = %w{rock spock paper lizard scissors}
  include Comparable

  attr_reader :title

  def initialize(title)
    @title = title
  end

  def <=>(other)
    return 0 if self.index == other.index
    if (self.index - other.index) % 5 < 3
      1
    else
      -1
    end
  end

  def index
    @index ||= LIST.index(title)
  end

end