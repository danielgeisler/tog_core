module Plugins
  def self.settings(plugin, settings, options={})
   options.reverse_merge! :force => false
   
   if settings.is_a? Hash
     unless options[:force]
       settings.each_pair{|k,v| Tog::Config.init_with("plugins.#{plugin}.#{k.to_s}", v) }
     else
       settings.each_pair{|k,v| Tog::Config["plugins.#{plugin}.#{k.to_s}"] = v }
     end
   else
     Tog::Config["plugins.#{plugin}.#{settings.to_s}"]
   end
  end  
  def self.observers           
    Desert::Rails::Observer.observers
  end
  
  def self.helpers(*args)
    args.flatten.each do |hlp|
      case hlp
        when Module
          ActionController::Base.helper hlp
        else
          raise ArgumentError, "helpers expects a Module argument (was: #{args.inspect})"
      end
    end
  end
  
end