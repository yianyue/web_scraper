# Post class so it has the following attributes: 
# title, url, points, and item_id
require './comment'

class Post
  attr_accessor :title, :url, :points, :item_id

  def initialize()
    @title
    @url
    @points
    @item_id
    @comments = []
  end

  def info
    "Title: #{@title}\nArticle URL: #{@url}\nScores: #{@points}\nItem ID: #{@item_id}\nComments: #{@comments.length}"
  end

  def comments
    # returns all the comments associated with a particular post
    @comments
  end

  def add_comment(comment)
    # takes a Comment object as its input and adds it to the comment list
    @comments << comment
  end
end