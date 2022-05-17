require 'json'

class Person

    attr_accessor :fname, :lname

    def as_json(options={})
        {
            fname: @fname,
            lname: @lname
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end

end

p = Person.new
p.fname = "Mike"
p.lname = "Smith"

# case 1
puts p.to_json                  # output: {"fname":"Mike","lname":"Smith"}

# case 2
puts [p].to_json                # output: [{"fname":"Mike","lname":"Smith"}]

# case 3
h = {:some_key => p}
puts h.to_json                  # output: {"some_key":{"fname":"Mike","lname":"Smith"}}

puts JSON.pretty_generate(h)    # output
                                # {
                                #   "some_key": {
                                #     "fname": "Mike",
                                #     "lname": "Smith"
                                #   }
                                # }
