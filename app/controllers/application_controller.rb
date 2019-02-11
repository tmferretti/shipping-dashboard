class ApplicationController < ActionController::API
  def self.expose(variable_name)
    define_method(variable_name) do
      @exposed_variables ||= {}
      @exposed_variables[variable_name] ||= yield
      @exposed_variables.each { |name, value| instance_variable_set("@#{name}", value) }
    end
    helper_method variable_name

  end
end
