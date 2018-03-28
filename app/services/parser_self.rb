  require 'openssl'
  require 'nokogiri'
  require 'simple-rss'
  require 'open-uri'

  class Parser_self
    def perform
      # Parser for Ria
      url = 'https://ria.ru/lenta/'
      doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) )
      entries = doc.css('.b-list-normal')[0].css('.b-list').css('.b-list__item')

      entries.first(5).each do |entry|
        #Cut out html from string
         # date_and_time =
         #   ActionView::Base.full_sanitizer.sanitize("#{entry.css('.entry-time').css('.span')}")

        RiaNew.create(
            # url: entry.css('.b-list__item').xpath('a/@href').first.value,
            url: entry.xpath('a/@href').first.value,
            title: entry.css('.b-list__item-title').css('span')[0].text,
            time: entry.css('.b-list__item-time').css('span')[0].text,
            date: entry.css('.b-list__item-date').css('span')[0].text
        )
        Article.create(
            # url: entry.css('.b-list__item').xpath('a/@href').first.value,
            url: entry.xpath('a/@href').first.value,
            title: entry.css('.b-list__item-title').css('span')[0].text,
            time: entry.css('.b-list__item-time').css('span')[0].text,
            date: entry.css('.b-list__item-date').css('span')[0].text
        )
      end

      # Parser for NewSLine
      rss = SimpleRSS.parse open('https://news.tut.by/rss/lady.rss')
      rss_entry = rss.entries
      rss_entry.first(5).each do |entry|

        NewSLine.create(
          url: entry.link,
          title: entry.title.force_encoding("UTF-8"),
          date: entry.pubDate.to_s.split(' ')[0],
          time: entry.pubDate.to_s.split(' ')[1]
        )

        Article.create(
          url: entry.link,
          title: entry.title.force_encoding("UTF-8"),
          date: entry.pubDate.to_s.split(' ')[0],
          time: entry.pubDate.to_s.split(' ')[1]
        )
      end

      #Place for log file
      log_file_path = "log/cron.log"
      File.open(log_file_path, "a") do |f|
        f.puts "Update Caught at: #{DateTime.now} \n"
    end
  end
end
