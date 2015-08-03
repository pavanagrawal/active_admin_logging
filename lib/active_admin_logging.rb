require "active_admin_logging/version"
require 'pp'

module ActiveAdmin
  module Logging
    extend ActiveSupport::Concern
    included do
      after_filter :log_every_action
    end
    private
    def log_every_action
      unless params[:controller] == 'admin/admin_logs'
        AdminLog.create admin_user_id: current_admin_user.id,
                        email: current_admin_user.email,
                        last_sign_in_at: current_admin_user.last_sign_in_at,
                        controller: params[:controller],
                        action: params[:action],
                        data_dump: params.inspect
      end
    end
  end
end
