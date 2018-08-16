# state patch
module React
  class State
    def self.set_state(object, name, value, delay=ALWAYS_UPDATE_STATE_AFTER_RENDER)
      states[object][name] = value
      if delay || @bulk_update_flag
        @delayed_updates ||= Hash.new { |h, k| h[k] = {} }
        @delayed_updates[object][name] = [value, Set.new]
        @delayed_updater ||= after(0.001) do
          # structure_check('delayed set state')
          delayed_updates = @delayed_updates
          @delayed_updates = Hash.new { |h, k| h[k] = {} }
          @delayed_updater = nil
          updates = Hash.new { |hash, key| hash[key] = Array.new }
          delayed_updates.each do |object, name_hash|
            name_hash.each do |name, value_and_set|
              set_state2(object, name, value_and_set[0], updates, value_and_set[1])
            end
          end
          updates.each { |observer, args|
# -------> CHECK to make sure observer is still in current_observers hash
            observer.update_react_js_state(*args) if current_observers.key?(observer)
# ------->
          }
          updates = nil
        end
      elsif @rendering_level == 0
        updates = Hash.new { |hash, key| hash[key] = Array.new }
        set_state2(object, name, value, updates)
        updates.each { |observer, args| observer.update_react_js_state(*args) }
      end
      value
    end
  end
end
