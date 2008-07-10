class Views::Main::Homepage < Views::Layouts::Application
  def render_body
    h1 "Workshopr"
    p "Check me out!"
  end
end
