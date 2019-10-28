module ApplicationHelper
  def flash_class(level)
    case level
    when 'success' then
      'is-success'
    when 'error' then
      'is-danger'
    when 'alert' then
      'is-danger'
    else
      'is-link'
    end
  end
end
