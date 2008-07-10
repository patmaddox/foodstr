module Widgets
  module Form
    def form_for(object_name, &block)
      object = instance_variable_get("@#{object_name}")
      Widgets::Form::Builder.new(self, object_name, object, &block)
    end

    class Builder
      def initialize(canvas, object_name, object, &block)
        @canvas = canvas
        @object_name = object_name
        @object = object
        builder = self

        @canvas.form(:action => '/users', :method => 'post') do
          block.call(builder)
          input(:type => :hidden, :name => :authenticity_token,
                :value => helpers.form_authenticity_token) if helpers.protect_against_forgery?
        end
      end

      def text_field(name)
        input_field name, :text
      end

      def password_field(name)
        input_field name, :password
      end

      def submit_tag(value="Save")
        @canvas.input :type => :submit, :value => value
      end

      private
      def attr_name(name)
        "#{@object_name}[#{name}]"
      end

      def input_field(name, input_type)
        object = @object
        field_name = attr_name(name)
        @canvas.div do
          label(name.to_s.humanize + ':', :for => field_name)
          input(:type => input_type, :name => field_name,
                :value => object.send(name))
        end        
      end
    end
  end
end