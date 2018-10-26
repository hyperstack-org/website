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
    begin
      React.create_element( Module.const_get(params.component_name), {key: params.random_key}) unless @errors
    rescue Exception => e
      puts "caught it but cant do anything about it"
      puts "error = #{e.message}"
    end
  end
end
