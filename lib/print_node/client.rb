module PrintNode
  class Client

    attr_accessor :username,
      :password,
      :address

    def self.connection
      PrintNode::Client.new.connection
    end

    def initialize
      @username      = username      || ENV['USERNAME']
      @password      = password      || ENV['PASSWORD']
      @address       = address       || 'https://api.printnode.com'
    end

    def connection
      Faraday.new(url: @address) do |conn|
        conn.basic_auth ENV['USERNAME'], ENV['PASSWORD']
        conn.request  :json
        conn.use      Faraday::Response::RaiseError
        conn.adapter  Faraday.default_adapter
      end
    end

  end
end