require 'resolv'

get '/config' do
  src = request.env['HTTP_X_IDENTITY'] || Resolv.new.getname(request.ip)

  content_type :json
  { :name => "appname", 
    :identified_as => src,
    :db_url => "db.hostname.com/db/name"}.to_json
end
