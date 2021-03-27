module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info mb-0'
    when 'success' then 'alert alert-success mb-0'
    when 'error' then 'alert alert-danger mb-0'
    when 'alert' then 'alert alert-warning mb-0'
    when 'recaptcha_error' then 'alert alert-danger mb-0'
    end
  end
end
