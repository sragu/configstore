get '/config' do
  content_type :json
  { :name => "appname", :db_url => "db.hostname.com/db/name"}.to_json
end
