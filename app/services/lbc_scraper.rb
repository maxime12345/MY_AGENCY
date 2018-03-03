class LbcScraper
  attr_reader :html_doc

  def initialize(url)
    RestClient.proxy = ENV['PROXY_ADDRESS']
    html_file = RestClient.get(url)
    @html_doc = Nokogiri::HTML(html_file)
  end

  def extract
    {
      name: html_doc.search('._1KQme').text,
      address: html_doc.search('._1aCZv span').text,
      price: html_doc.search('._1F5u3').text.split('€')[0],
      description: html_doc.search('._11TgD [data-qa-id="adview_description_container"] span').text,
      surface: html_doc.search('[data-qa-id="criteria_item_square"] ._3Jxf3').text,
      publication_date: html_doc.search('._3Pad-').text,
      nb_rooms: html_doc.search('[data-qa-id="criteria_item_rooms"] ._3Jxf3').text,
      photo: photos
    }
  end

  private

  def photos
    html_doc.search('.Lqamr > div').map do |photo|
      photo.attr('style')[/url\((.+)\)/, 1]
    end
  end
end
