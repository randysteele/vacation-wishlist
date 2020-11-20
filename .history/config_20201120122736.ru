require './config/environment'
run ApplicationController
use Rack::MethodOverride
use DestinationsController
use UsersController



if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


