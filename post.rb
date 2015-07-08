# Post class so it has the following attributes: 
# title, url, points, and item_id

class Post
  def initialize
    @title
    @url
    @points
    @item_id
  end

  def comments
    # returns all the comments associated with a particular post
  end

  def add_comment(comment)
    # takes a Comment object as its input and adds it to the comment list
  end
end