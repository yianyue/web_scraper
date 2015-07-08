require 'nokogiri'
require 'open-uri'
require './post.rb'

class Scraper
  IDDIGITS = 7
  LEVELWIDTH = 40

  def initialize(url)
    @url = url # url of the hackernews post
    # html_file is not necessary
    html_file = open(@url)
    @doc = Nokogiri::HTML(html_file) 
  end

  def scrape
    get_post
    get_comments
    print_stats
  end

  private

  def get_post
    # should these initializing steps be moved to post.rb?
    # pass the doc to Post.new?
    title = @doc.css('title').text
    # url of the article link
    url = @doc.css('tr.athing>td.title>a')[0]['href']
    # take the text with the class 'score' and split at the space
    # take the first part, then convert to integer
    points = @doc.css('.score').text.split(" ")[0].to_i
    # extracting the last 7 characters of the url only works with a web address
    item_id = @url[-IDDIGITS..-1]

    @post = Post.new(title, url, points, item_id)
  end

  def get_comments
    # first 'tr.athing' is the title block
    comments = @doc.css('tr.athing')
    comments.shift

    comments.each {|comment|
      user_name = comment.css('.comhead > a:first-child').text
      time = comment.css('.comhead > a:nth-child(2)').text
      # content is bracketed by \n
      content = comment.css('.comment').text
      level = comment.css('img')[0]['width'].to_i/LEVELWIDTH

      comment = Comment.new(user_name, time, content, level)

      @post.add_comment(comment)
    }
  end

  def print_stats
    puts @post.info
  end

end

scraper = Scraper.new(ARGV[0])
scraper.scrape