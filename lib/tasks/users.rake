namespace :users do

  desc 'Sets up the initial user for the environment. This only works if there is no users yet. The password should be changed immediately.'
  task create_initial: :environment do
    if User.count == 0
      User.create! email: 'admin@doesbrandonknow.com', password: 'meanstoanend', admin: true
    end
  end

end
