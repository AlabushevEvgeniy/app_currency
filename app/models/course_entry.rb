class CourseEntry < ApplicationRecord
  validates :value, :date, presence: true

  def self.update_course
    address = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze

    # Достаем данные с сайта Центробанка и записываем их в XML
    response = Net::HTTP.get_response(URI.parse(address))
    doc = REXML::Document.new(response.body)

    doc.each_element('//Valute[@ID="R01235"]') do |currency_tag|
      # Достаём название валюты и курс
      @name = currency_tag.get_text('Name')
      @value = currency_tag.get_text('Value')
    end
  end
end
