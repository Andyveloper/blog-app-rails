require_relative 'boot'



require 'rails/all'



Bundler.require(*Rails.groups)



module BlogAppRails

  class Application < Rails::Application

    config.load_defaults 7.0

    config.assets.css_compressor = nil

  end

end



