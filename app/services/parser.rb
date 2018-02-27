require 'openssl'
  require 'nokogiri'
  require 'open-uri'

  class Parser

def perform


    url = 'https://ria.ru/lenta/'
    doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) )
    entries = doc.css('.b-list-normal')


    for enum in 0..3
      RiaNew.create(
          url: entries.css('.b-list__item')[enum].xpath('a/@href').first.value,
          title: entries.css('.b-list__item-title')[enum].css('span')[0].text,
          time: entries.css('.b-list__item-time')[enum].css('span')[0].text,
          date: entries.css('.b-list__item-date')[enum].css('span')[0].text
        )
    end
  end
end
