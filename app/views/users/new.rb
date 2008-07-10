class Views::Users::New < Views::Layouts::Application
  def render_body
    h3 "Sign up as a new user"
    p "All fields are required"

    form_for(:user) do |f|
      f.text_field :first_name
      f.text_field :last_name
      f.text_field :login
      f.text_field :email
      f.password_field :password
      f.submit "Sign up"
    end
  end
end
