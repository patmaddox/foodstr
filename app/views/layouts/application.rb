class Views::Layouts::Application < Widgets::Workshopr
  def render
    html do
      head do
        title "Workshopr"
      end

      body do
        render_body
      end
    end
  end
end
