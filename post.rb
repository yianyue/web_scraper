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
    \rComments: #{@comments.length.to_s.colorize(:red)}
    \rTop Commenter: #{top_commenter}"
  end

  def comments
    # returns all the comments associated with a particular post
    @comments
  end

  def add_comment(comment)
    # takes a Comment object as its input and adds it to the comment list
    @comments << comment
  end

  def top_commenter
    # commenters is an array containing all the user names
    commenters = @comments.map{|comment|
      comment.user_name
    }
    # group is a hash with user name as hash key, and an array of every occurance of the same user name as value
    group = commenters.group_by{|commenter| commenter}
    # group.values returns an array of the values in the hash (an arry of arrays)
    # .max_by(&:size) picks out the entry with the largest array
    top_commenter = group.values.max_by(&:size).first
  end

end