class HelloController < ApplicationController
  def index
    @ria_all_news = RiaNew.all

    #title_first = entries.css('.b-list__item-title')[0].css('span')[0].text
    #title_first_url = entries.css('.b-list__item')[0].xpath('a/@href').first.value

    #title_second = entries.css('.b-list__item-title')[1].css('span')[0].text
     #title_second_url = entries.css('.b-list__item')[1].xpath('a/@href').first.value

    #title_third = entries.css('.b-list__item-title')[2].css('span')[0].text
     #title_third_url = entries.css('.b-list__item')[2].xpath('a/@href').first.value

    #@shown_title_first = title_first
    #@shown_title_first_url = title_first_url

    #@shown_title_second = title_second
    #@shown_title_second_url = title_second_url

    #@shown_title_third = title_third
    #@shown_title_third_url = title_third_url

  end
end
