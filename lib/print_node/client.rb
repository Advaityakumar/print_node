module PrintNode
  class Client

    attr_accessor :username,
      :password,
      :address

    def self.connection(options={})
      PrintNode::Client.new(options).connection
    end

    def initialize(options={})
      @username      = options[:username]      || ENV['USERNAME']
      @password      = options[:password]      || ENV['PASSWORD']
      @address       = 'https://api.printnode.com'
    end

    def connection
      Faraday.new(url: @address) do |conn|
        conn.basic_auth @username, @password
        conn.request  :json
        conn.use      Faraday::Response::RaiseError
        conn.adapter  Faraday.default_adapter
      end
    end

  end
end