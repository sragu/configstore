require 'resolv'

get '/config' do
  content_type :json

  { :name => "appname", 
    :identified_as => Resolv.new.getname(request.ip),
    :db_url => "db.hostname.com/db/name"}.to_json
end
