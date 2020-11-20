require './config/environment'

run Sinatra::Application


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use DestinationsController
use UsersController
run ApplicationController
