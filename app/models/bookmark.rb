require 'embedly'
require 'json'

class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy
  
  
  def self.get_preview(input_url)
    embedly_api =
    Embedly::API.new :key => '08e70a52f3dd4ac7b046be259dcc0e57',
                    :user_agent => 'Mozilla/5.0 (compatible; Blocmarks/1.0; paulclifford2570@gmail.com)'

    obj = embedly_api.oembed :url => input_url
    puts 'HTMLHTMLHTML'
    video = obj.first.html
    puts video
    puts 'ThumbnailThumnail'
    thumbnail = obj.first.thumbnail_url
    puts thumbnail
    #json_obj = JSON.pretty_generate(obj[0].marshal_dump)
    if video != nil
        video
    else
        thumbnail
    end
  end
end
