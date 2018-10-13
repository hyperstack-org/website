# module React
#   class << self
#     alias original_render render
#     def render(*args, &block)
#       original_render(*args, &block)
#     rescue JS::Error => e
#       raise e unless e.message == "Cannot read property '__opalInstance' of null"
#     end
#   end
# end
