class RenderComponent < HyperComponent
  param :component_name
  param :random_key

  before_update { @errors = false }

  after_error do |error, info|
    puts "error = #{error}"
    puts "info = #{info}"
    @errors = true
   end

  render do
    return if @errors
    Hyperstack::Component::ReactAPI.create_element(
      Module.const_get(params.component_name),
      key: params.random_key
    )
  end
end
