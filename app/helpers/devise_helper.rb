module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    messages = resource.errors.full_messages.each do |errmsg|
      html += <<-EOF
      <div class="devise-alert" role="alert">
        <div>#{errmsg}</div>
        <div class="error-close-btn"><i class="fas fa-times"></i></div>
      </div>
      EOF
    end
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end