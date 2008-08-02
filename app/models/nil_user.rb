class NilUser
  include Singleton
  
  def nil?
    true
  end

  def can_create_restaurants?
    false
  end

  def can_create_menu_items?
    false
  end
end
