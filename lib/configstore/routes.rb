require_relative 'dns'

get '/config' do
  src = request.env['HTTP_X_IDENTITY'] || request.ip
  host = Host::Machine.new src

  content_type :json

  headers "X-Identified-As" => host.identity.to_s

  { :name => "appname", 
    :identified_as => host.identity.to_s,
    :environment => host.environment,
    :db_url => "db.hostname.com/db/name"}.to_json
end
