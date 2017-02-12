class ForwardMX
  require 'json'
  require 'net/http'
  require 'net/https'

  VERSION = "0.1.0"
  API_URL = "https://forwardmx.io/api"

  class Result
    attr_accessor :ok, :error, :success
    def initialize data
      @ok = data['ok']
      @error = data['error']
      @success = @ok.nil? ? false : true
    end
  end

  Alias  = Struct.new(:source, :destination, :count)
  Domain = Struct.new(:domain, :created_at, :status, :aliases) do
    def initialize(*args)
      super(*args)
      self.created_at = Time.parse(self.created_at)
      self.aliases = self.aliases.map{|a| Alias.new(*a.values)}
    end
  end

  def initialize apikey
    @apikey = apikey
  end

  def domains
    post('domains').map{|d| Domain.new(*d.values)}
  end

  def aliases domain
    post('aliases', {domain: domain}).map{|d| Alias.new(*d.values)}
  end

  def create_domain domain
    Result.new(post('domain/create', {domain: domain}))
  end

  def destroy_domain domain
    Result.new(post('domain/destroy', {domain: domain}))
  end

  def create_alias domain, _alias, destination
    Result.new(post('alias/create', {domain: domain, alias: _alias, destination: destination}))
  end

  def destroy_alias domain, _alias
    Result.new(post('alias/destroy', {domain: domain, alias: _alias}))
  end

  def update_alias domain, _alias, destination
    Result.new(post('alias/update', {domain: domain, alias: _alias, destination: destination}))
  end

  private

  def post path, options = {}
    options.merge!(key: @apikey)
    x = Net::HTTP.post_form(URI.parse("#{API_URL}/#{path}"), options)
    JSON.parse(x.body)
  end
end
