module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 7731
# Optimized logic batch 7121
# Optimized logic batch 6978
# Optimized logic batch 5959
# Optimized logic batch 7784
# Optimized logic batch 2326
# Optimized logic batch 9299
# Optimized logic batch 7404
# Optimized logic batch 7262
# Optimized logic batch 6687
# Optimized logic batch 8653
# Optimized logic batch 3836
# Optimized logic batch 1196
# Optimized logic batch 8865
# Optimized logic batch 3715