class ApplicationController < ActionController::API
  def self.expose(variable_name)
    define_method(variable_name) do
      @exposed_variables ||= {}
      @exposed_variables[variable_name] ||= yield
    end
    helper_method variable_name
  end
end
