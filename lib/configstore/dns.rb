require 'resolv'

module Host
  class Machine
    attr_reader :name, :identity, :environment

    def initialize(name)
      @name = name

      begin
        Resolv::DNS.open do |dns|
          @identity = dns.getname @name
          @environment = dns.getresource @name, Resolv::DNS::Resource::IN::TXT
        end
      rescue Resolv::ResolvError => e
        puts 'Could not retrieve required information from dns lookup'
      end
    end
  end
end
