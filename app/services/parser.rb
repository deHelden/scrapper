  require 'openssl'
  require 'nokogiri'
  require 'open-uri'

  class Parser
    def perform
      url = 'https://ria.ru/lenta/'
      doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) )
      entries = doc.css('.b-list-normal')[0].css('.b-list')

      entries.first(3).each do |entry|
        RiaNew.create(
            url: entry.css('.b-list__item').xpath('a/@href').first.value,
            title: entry.css('.b-list__item-title').css('span')[0].text,
            time: entry.css('.b-list__item-time').css('span')[0].text,
            date: entry.css('.b-list__item-date').css('span')[0].text
        )
      end
    end
end
