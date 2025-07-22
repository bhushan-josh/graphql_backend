class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery unless: -> { request.format.json? }

  def run_migrations
    if Rails.env.production?
      begin
        ActiveRecord::Migrator.migrate(Rails.root.join("db/migrate"))
        render plain: "Migrations ran successfully!"
      rescue => e
        render plain: "Migration failed: #{e.message}"
      end
    else
      head :forbidden
    end
  end
end
