module Spec
  module Matchers
    class RenderWidget < Struct.new(:widget_class, :controller)
      def matches?(actual)
        controller.instance_variable_get(:@__widget_class) == widget_class
      end

      def failure_message
        return "expected #{@actual.inspect} to be a widget of class #{widget_class}"
      end

      def negative_failure_message
        return "expected #{@actual.inspect} to not be a widget of class #{widget_class}"
      end
    end

    def render_widget(widget_class)
      Matchers::RenderWidget.new(widget_class, @controller)
    end
  end
end
