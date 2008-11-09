module Riddle
  class Configuration
    class Section
      class << self
        attr_accessor :settings
      end
      
      settings = []
      
      def valid?
        true
      end
      
      private
      
      def settings_body
        self.class.settings.select { |setting|
          !send(setting).nil?
        }.collect { |setting|
          conf = Array(send(setting)).collect { |set|
            "  #{setting} = #{set}"  
          }
          conf.length == 0 ? nil : conf
        }.flatten.compact
      end
    end
  end
end