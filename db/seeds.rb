#creating users


randy = User.create(:name => "Randy", :email => "steelerx155@gmail.com", :password => "password")
kristy = User.create(:name => "Kristy", :email => "kristy@gmail.com", :password => "password")

Destination.create(:city => "Honolulu", :state => "Hawaii", :distance => "25 hours")

randy.destinations.create(:city => "Waikiki Beach")

kristys_destination = kristy.destinations.build(:city => "Colorado Springs")
kristys_destination.save
