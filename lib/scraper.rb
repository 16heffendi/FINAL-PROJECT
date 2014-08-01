require 'open-uri' 
class Batman

  def initialize(to)
    @to = to
  end

  def item
    @products= []
    url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=Batman&Find.x=0&Find.y=0&Find=Find"  
    doc = Nokogiri::HTML(open(url))  
    doc.css(".item").each do |item|  
      @products << item.at_css(".prodLink").text  
    end
  

    # put your own credentials here
    account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
    auth_token = '2008ea097713e401a16c54029058da82'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      :from => '+18152642023',
      :to => @to,
      :body => "Here are the items#{@products} you requested, http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=Batman&Find.x=0&Find.y=0&Find=Find "
    )
  end
end
