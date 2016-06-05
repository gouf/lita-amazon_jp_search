require 'mechanize/amazon_jp_search/client'

module Lita
  module Handlers
    class AmazonJpSearch < Handler
      # insert handler code here
      route(/^amazon\s(.+)/i, :search_amazon)

      Lita.register_handler(self)
    end
  end
end
