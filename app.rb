require "sinatra"
require "gschool_database_connection"
require "rack-flash"

class App < Sinatra::Base
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
  end

  get "/" do
    erb :home
  end

  post "/" do
      @database_connection.sql = <<-SQL
      INSERT INTO users (username, email, password)
      VALUES ('#{params[:username]}','#{params[:password]}', '#{params[:email]}')
      SQL
    redirect "/"
  end
end
