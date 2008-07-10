class MainController < ApplicationController
  def homepage
    render :widget => Views::Main::Homepage
  end
end
