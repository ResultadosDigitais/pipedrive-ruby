module Pipedrive
  class Person < Base

    class << self

      def find_or_create_by_name(name, opts={})
        find_by_name(name, :org_id => opts[:org_id]).first || create(opts.merge(:name => name))
      end

    end

    def deals(api_token, params={})
      res = get "#{resource_path}/#{id}/deals?api_token=#{api_token}", query: params
      res['data'].nil? ? [] : res['data'].map{|obj| Deal.new(obj)}
    end
  end
end
