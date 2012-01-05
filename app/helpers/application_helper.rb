module ApplicationHelper
  def update_url(obj)
    "/#{obj.class.to_s.downcase}/update"
  end
end
