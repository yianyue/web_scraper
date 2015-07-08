# Post class so it has the following attributes: 
# title, url, points, and item_id
require './comment'
require 'colorize'

class Post

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end

  def info
    "Title: #{@title.colorize(:red)}
    \rArticle URL: #{@url.colorize(:blue)}
    \rScores: #{@points.to_s.colorize(:green)}
    \rItem ID: #{@item_id.colorize(:green)}
    \rComments: #{@comments.length.to_s.colorize(:red)}"
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