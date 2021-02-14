# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class FetchEnglishTopicService
  FETCH_URL = 'http://iteslj.org/questions/'
  CATEGORY_SELECTOR = 'table > tr ul > li > a'
  TOPIC_SELECTOR = 'div.main.wide > ul > li'

  SLEEP_TIME = 30

  def self.call!
    new.send :call!
  end

  private

  def call!
    create_category!
    Category.all.find_each { |category| create_topics! category }
  end

  def create_category!
    doc = Nokogiri::HTML(URI.open(FETCH_URL))
    doc.css(CATEGORY_SELECTOR).each do |link|
      category = Category.find_or_initialize_by name: link.text
      category.url = FETCH_URL + link[:href]
      category.save!
    end

    sleep SLEEP_TIME
  end

  def create_topics!(category)
    doc = Nokogiri::HTML(URI.open(category.url))

    doc.css(TOPIC_SELECTOR).each do |link|
      topic = category.topics.find_or_initialize_by name: link.children.first.text
      topic.save!
    end

    sleep SLEEP_TIME
  end
end
