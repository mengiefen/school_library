require 'pry'

class Greet
  def self.english(username)
    "Hello #{username}"
  end

  def self.spanish(username)
    "Holla #{username}"
  end

  def self.deutch(username)
    binding.pry
    "Hallo #{usernme}"
  end

  def self.aragonese(username)
    "ola #{username}"
  end
end

a = Greet.new



