# module React
#   # NativeLibrary handles importing JS libraries. Importing native components is handled
#   # by the React::Base.  It also provides several methods used by auto-import.rb
#
#   # A NativeLibrary is simply a wrapper that holds the name of the native js library.
#   # It responds to const_missing and method_missing by looking up objects within the js library.
#   # If the object is a react component it is wrapped by a reactrb component class, otherwise
#   # a nested NativeLibrary is returned.
#
#   # Two macros are provided: imports (for naming the native library) and renames which allows
#   # the members of a library to be given different names within the ruby name space.
#
#   # Public methods used by auto-import.rb are import_const_from_native and find_and_render_component
#   class NativeLibrary
#     class << self
#       def imports(native_name)
#         @native_prefix = "#{native_name}."
#         self
#       end
#
#       def rename(rename_list)
#         # rename_list is a hash in the form: native_name => ruby_name, native_name => ruby_name
#         rename_list.each do |js_name, ruby_name|
#           native_name = lookup_native_name(js_name)
#           if lookup_native_name(js_name)
#             create_component_wrapper(self, native_name, ruby_name) ||
#               create_library_wrapper(self, native_name, ruby_name)
#           else
#             raise "class #{name} < React::NativeLibrary could not import #{js_name}. "\
#             "Native value #{scope_native_name(js_name)} is undefined."
#           end
#         end
#       end
#
#       def import_const_from_native(klass, const_name, create_library)
#         begin
#           native_name = lookup_native_name(const_name) ||
#                         lookup_native_name(const_name[0].downcase + const_name[1..-1])
#           native_name && (
#             create_component_wrapper(klass, native_name, const_name) || (
#               create_library &&
#                 create_library_wrapper(klass, native_name, const_name)))
#         rescue Exception
#           # barrie
#         end
#       end
#
#       def const_missing(const_name)
#         import_const_from_native(self, const_name, true) || super
#       end
#
#       def method_missing(method, *args, &block)
#         component_class = const_get(method) if const_defined?(method, false)
#         component_class ||= import_const_from_native(self, method, false)
#         raise 'could not import a react component named: '\
#               "#{scope_native_name method}" unless component_class
#         React::RenderingContext.render(component_class, *args, &block)
#       end
#
#       private
#
#       def lookup_native_name(js_name)
#         native_name = scope_native_name(js_name)
#         `eval(#{native_name}) !== undefined && native_name`
#       # rubocop:disable Lint/RescueException  # that is what eval raises in Opal >= 0.10.
#       rescue Exception
#         nil
#         # rubocop:enable Lint/RescueException
#       end
#
#       def scope_native_name(js_name)
#         "#{@native_prefix}#{js_name}"
#       end
#
#       def create_component_wrapper(klass, native_name, ruby_name)
#         if React::API.native_react_component?(native_name)
#           new_klass = klass.const_set ruby_name, Class.new
#           new_klass.class_eval do
#             include Hyperstack::Component::Mixin
#             imports native_name
#           end
#           new_klass
#         end
#       end
#
#       def create_library_wrapper(klass, native_name, ruby_name)
#         klass.const_set ruby_name, Class.new(React::NativeLibrary).imports(native_name)
#       end
#     end
#   end
# end
#
# module Hyperstack
#   class Component
#     class << self
#       def mounted_components
#         @mounted_components ||= Set.new
#       end
#
#       def force_update!
#         components = mounted_components.to_a
#         components.each do |comp|
#           next unless mounted_components.include? comp
#           comp.force_update!
#         end
#       end
#     end
#
#     module Mixin
#       def self.included(base)
#         base.include(Hyperstack::Store::Mixin)
#         base.include(React::Component::API)
#         base.include(React::Callbacks)
#         base.include(React::Component::Tags)
#         base.include(React::Component::DslInstanceMethods)
#         base.include(React::Component::ShouldComponentUpdate)
#         base.class_eval do
#           class_attribute :initial_state
#           define_callback :before_mount
#           define_callback :after_mount
#           define_callback :before_receive_props
#           define_callback :before_update
#           define_callback :after_update
#           define_callback :before_unmount
#           define_callback(:after_error) { React::API.add_after_error_hook(base) }
#         end
#         base.extend(React::Component::ClassMethods)
#       end
#
#       def self.deprecation_warning(message)
#         React::Component.deprecation_warning(name, message)
#       end
#
#       def deprecation_warning(message)
#         React::Component.deprecation_warning(self.class.name, message)
#       end
#
#       def initialize(native_element)
#         @native = native_element
#         init_store
#       end
#
#       def emit(event_name, *args)
#         if React::Event::BUILT_IN_EVENTS.include?(built_in_event_name = "on#{event_name.to_s.event_camelize}")
#           params[built_in_event_name].call(*args)
#         else
#           params["on_#{event_name}"].call(*args)
#         end
#       end
#
#       def component_will_mount
#         begin
#           React::IsomorphicHelpers.load_context(true) if React::IsomorphicHelpers.on_opal_client?
#           React::State.set_state_context_to(self) do
#             Hyperstack::Component.mounted_components << self
#             run_callback(:before_mount)
#           end
#         rescue Exception
#           # barrie
#         end
#       end
#
#       def component_did_mount
#         begin
#           React::State.set_state_context_to(self) do
#             run_callback(:after_mount)
#             React::State.update_states_to_observe
#           end
#         rescue Exception
#           # barrie
#         end
#       end
#
#       def component_will_receive_props(next_props)
#         # need to rethink how this works in opal-react, or if its actually that useful within the react.rb environment
#         # for now we are just using it to clear processed_params
#         begin
#           React::State.set_state_context_to(self) { run_callback(:before_receive_props, next_props) }
#           @_receiving_props = true
#         rescue Exception
#           # barrie
#         end
#       end
#
#       def component_will_update(next_props, next_state)
#         begin
#           React::State.set_state_context_to(self) { run_callback(:before_update, next_props, next_state) }
#           params._reset_all_others_cache if @_receiving_props
#           @_receiving_props = false
#         rescue Exception
#           # barrie
#         end
#       end
#
#       def component_did_update(prev_props, prev_state)
#         begin
#           React::State.set_state_context_to(self) do
#             run_callback(:after_update, prev_props, prev_state)
#             React::State.update_states_to_observe
#           end
#         rescue Exception
#           # barrie
#         end
#       end
#
#       def component_will_unmount
#         begin
#           React::State.set_state_context_to(self) do
#             run_callback(:before_unmount)
#             React::State.remove
#             Hyperstack::Component.mounted_components.delete self
#           end
#         rescue Exception
#           # barrie
#         end
#       end
#
#       def component_did_catch(error, info)
#         React::State.set_state_context_to(self) do
#           run_callback(:after_error, error, info)
#         end
#       end
#
#       attr_reader :waiting_on_resources
#
#       def update_react_js_state(object, name, value)
#         if object
#           name = "#{object.class}.#{name}" unless object == self
#           # Date.now() has only millisecond precision, if several notifications of
#           # observer happen within a millisecond, updates may get lost.
#           # to mitigate this the Math.random() appends some random number
#           # this way notifactions will happen as expected by the rest of Hyperstack
#           set_state(
#             '***_state_updated_at-***' => `Date.now() + Math.random()`,
#             name => value
#           )
#         else
#           set_state name => value
#         end
#       end
#
#       def set_state_synchronously?
#         @native.JS[:__opalInstanceSyncSetState]
#       end
#
#       def render
#         raise 'no render defined'
#       end unless method_defined?(:render)
#
#       def _render_wrapper
#         React::State.set_state_context_to(self, true) do
#           element = React::RenderingContext.render(nil) { render || '' }
#           @waiting_on_resources =
#             element.waiting_on_resources if element.respond_to? :waiting_on_resources
#           element
#         end
#       end
#
#       def watch(value, &on_change)
#         Observable.new(value, on_change)
#       end
#
#       def define_state(*args, &block)
#         React::State.initialize_states(self, self.class.define_state(*args, &block))
#       end
#     end
#   end
# end
