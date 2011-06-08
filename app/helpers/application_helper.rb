module ApplicationHelper
  def to_md(html, options = {})
    html = transform_fence_code html # transform ``` stuff
    html = RDiscount.new(html).to_html # get html
    html = sanitize html #sanitize HTML
    unless options.empty?
      html = truncate(html, options)
    end
    html
   end

  def transform_fence_code text
    puts text.inspect
    open = "<pre><code>\n"
    close = "</code></pre>\n"
    n = 0
    puts text.inspect
    text = text.gsub(/^```/) { |match|
      n = n+=1 # update counter
      ((n%2==0) ? close : open) # open or close pre+code sequence
    }
    text
  end

  def get_name_or_you(user)
    (user == current_user)?"tu":user.name
  end
end
