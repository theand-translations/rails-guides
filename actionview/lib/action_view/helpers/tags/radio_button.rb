require 'action_view/helpers/tags/checkable'

module ActionView
  module Helpers
    module Tags # :nodoc:
      class RadioButton < Base # :nodoc:
        include Checkable

        def initialize(object_name, method_name, template_object, tag_value, options)
          @tag_value = tag_value
          super(object_name, method_name, template_object, options)
        end

        def render
          options = @options.stringify_keys
          options[StringPool::TYPE]     = "radio"
          options[StringPool::VALUE]    = @tag_value
          options[StringPool::CHECKED] = StringPool::CHECKED if input_checked?(object, options)
          add_default_name_and_id_for_value(@tag_value, options)
          tag(StringPool::INPUT, options)
        end

        private

        def checked?(value)
          value.to_s == @tag_value.to_s
        end
      end
    end
  end
end