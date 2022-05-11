class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} name should be correctable '#{__method__}'"
  end
end
