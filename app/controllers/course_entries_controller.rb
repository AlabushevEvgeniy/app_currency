class CourseEntriesController < ApplicationController
  def current
    # закачиваем курс валюты с сайта
    URL = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze

    # Достаем данные с сайта Центробанка и записываем их в XML
    response = Net::HTTP.get_response(URI.parse(URL))
    doc = REXML::Document.new(response.body)

    # Для того, чтобы найти курс валюты, необходимо знать её ID в XML-файле
    #
    # R01235 — Доллар США
    # R01239 — Евро

    # Найдём в документе соответствующие элементы
    doc.each_element('//Valute[@ID="R01235" or @ID="R01239"]') do |currency_tag|
      # Достаём название валюты и курс
      name = currency_tag.get_text('Name')
      value = currency_tag.get_text('Value')

      # Аккуратно выводим пользователю
      puts "#{name}: #{value} руб."
  end

  def new
    @course_entry = Course_entry.new
  end

  def create

  end
end
