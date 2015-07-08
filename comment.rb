class Comment
  attr_reader :user_name
  def initialize(user_name, time, content, level)
    @user_name = user_name
    @time = time
    @content = content
    # comment level is tracked by width of the image s.gif wrapped in td class = "ind"
    # 0, 40, 80 ...
    @level = level
  end

end