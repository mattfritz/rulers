class Object
  def self.const_missing(c)
    return nil if @calling_const_missing || (const_defined? c)

    @calling_const_missing = true
    require Rulers.to_underscore(c.to_s)
    klass = Object.const_get(c) #
    @calling_const_missing = false

    klass if klass.to_s == c.to_s
  end
end
