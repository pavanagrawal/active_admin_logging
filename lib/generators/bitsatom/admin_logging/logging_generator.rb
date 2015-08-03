module Bitsatom
  module Generators
    class LoggingGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def install_device_invitable
        unless gem_available?("active_admin")
          puts "The logging generator requires active_admin gem"

          if yes?("Run happy_seed:devise now?")
            generate "happy_seed:devise"
          else
            exit
          end
        end

        generate "model AdminLog admin_user_id:integer email:string last_sign_in_at:datetime controller:string action:string data_dump:text"

        generate "active_admin:resource AdminLog"

        directory '.'

        inject_into_class "config/application.rb", "Application", "  config.autoload_paths += %W(#{config.root}/lib/active_admin)\n"

      end

      private
      def gem_available?(name)
        Gem::Specification.find_by_name(name)
      rescue Gem::LoadError
        false
      rescue
        Gem.available?(name)
      end

    end
  end
end