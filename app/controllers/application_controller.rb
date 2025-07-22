class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery unless: -> { request.format.json? }

  def run_migrations
    if Rails.env.production?
      begin
        require 'rake'
        Rails.application.load_tasks
        Rake::Task['db:migrate'].invoke
        render plain: "Migrations ran successfully!"
      rescue => e
        render plain: "Migration failed: #{e.message}"
      end
    else
      head :forbidden
    end
  end

  def run_seeds
    if Rails.env.production?
      begin
        require 'rake'
        Rails.application.load_tasks
        Rake::Task['db:seed'].reenable
        Rake::Task['db:seed'].invoke
        render plain: "Seeding ran successfully!"
      rescue => e
        render plain: "Seeding failed: #{e.message}"
      end
    else
      head :forbidden
    end
  end
end
