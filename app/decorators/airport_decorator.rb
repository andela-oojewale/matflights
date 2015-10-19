class AirportDecorator

  def initialize(airport)
    @airport = airport
  end


  def method_missing(method_name, *args, &block)
    @airport.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    @airport.respond_to?(method_name, include_private) || super
  end

end