class Card < ActiveRecord::Base
  require 'nokogiri'
  require 'open-uri'
  require 'chinese_pinyin'

  def self.fetch_character_breakdown(character)
    url  = "https://characterpop.com/explode/#{character}"
    mechanize = Mechanize.new
    page = mechanize.get(url)
    output_html = page.at(".tree:first-child").inner_html
    return output_html
  end

  def self.hanzi_to_piyin(hanzi)
    Pinyin.t(hanzi, tonemarks: true)
  end



  def attempt(answered_correctly)
    update_column(:attempted, attempted + 1)
    update_column(:correct, correct + 1) if answered_correctly
  end

end
