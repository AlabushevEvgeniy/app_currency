# require 'net/http'
require 'rexml/document'

class CourseEntriesController < ApplicationController
  def current
    # закачиваем курс валюты с сайта
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

  def new
    @course_entry = CourseEntry.new
  end

  def create

  end
end
