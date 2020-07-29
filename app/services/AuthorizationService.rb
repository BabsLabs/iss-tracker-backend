require 'dotenv/load'

class AuthorizationService
  def self.authorize(request)
    check_request(request)
  end

  private 

    def self.check_request(request)
      begin 
        if request['HTTP_SUPER_SECRET_TOKEN'] == ENV['SUPER_SECRET_TOKEN']
          true
        else
          throw :halt, [ 401, 'Unauthorized - request lacks valid authentication credentials' ]
        end
      rescue UncaughtThrowError => e
          puts(e)
          return false
      rescue => e
          puts(e)
          return false
      end
    end
end