# frozen_string_literal: true

require 'dry-initializer'

module NeppanClient
  class BaseService
    extend Dry::Initializer

    class << self
      def call(*args, **kwargs, &block)
        new(*args, **kwargs).call(&block)
      end

      def new(*args, **kwargs)
        super(*args, **symbolize_keys_deep(kwargs))
      end

      private

      def symbolize_keys_deep(hash)
        hash.each_with_object({}) do |(k, v), result|
          key = k.is_a?(String) ? k.to_sym : k
          result[key] =
            if v.is_a?(Hash)
              symbolize_keys_deep(v)
            else
              v
            end
        end
      end
    end
  end
end
