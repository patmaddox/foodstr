class Widgets::Workshopr < Erector::Widget
  include Widgets::Form
  after_initialize { enable_prettyprint true }
end
