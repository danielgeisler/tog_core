module Version
  Major = '0'
  Minor = '1'
  Tiny  = '1'
  Module= 'tog_core'
  # http://en.wikipedia.org/wiki/Moons_of_Jupiter
  #Codename = 'Adrastea'
  class << self
    def to_s
      [Major, Minor, Tiny].join('.')
    end
    def full_version
      "#{Module} #{[Major, Minor, Tiny].join('.')}"
    end
    alias :to_str :to_s
  end
end
