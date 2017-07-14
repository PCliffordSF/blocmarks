require 'embedly'
require 'json'

class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy
  
  
  def self.get_preview(input_url)
    embedly_api =
    Embedly::API.new :key => ENV['EMBEDLY_API_KEY'],
                    :user_agent => 'Mozilla/5.0 (compatible; Blocmarks/1.0; paulclifford2570@gmail.com)'

    obj = embedly_api.oembed :url => input_url
    #puts obj[0].marshal_dump
    json_obj = JSON.pretty_generate(obj[0].marshal_dump)
    puts json_obj
    video = obj.first.html
    thumbnail = obj.first.thumbnail_url
    return video unless video.nil?
    thumbnail
  end
end
