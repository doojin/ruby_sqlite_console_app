class User
  attr_accessor :name, :gender, :group

  def initialize(name, gender, group)
    @name = name
    @gender = gender
    @group = group
  end

end