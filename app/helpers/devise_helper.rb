module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="notifications">
      <div class="notification is-danger" role="alert">
        <button class="delete" onclick="this.parentNode.remove();"></button>
        #{messages}
      </div>
    </div>
    HTML
    html.html_safe
  end
end
