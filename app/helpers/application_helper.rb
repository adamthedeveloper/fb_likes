module ApplicationHelper
  def list_likes(likes)
    return "None" if likes.size < 1
    html = "<ul>"
    likes.each do |like|
      html << "<li>#{like.name}</li>"
    end
    raw(html << "</ul>")
  end
end
