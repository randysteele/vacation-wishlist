randy = User.create(name: "Randy", username: steelerx155@gmail.com, password: "password")
kristy = User.create(name: "Kristy", username: kritsy@gmail.com, password: "password")

Destination.create(city: "Honolulu", state: "Hawaii", user_id: "distance: "25 hours", )

randy.destinations.create(city: "Waikiki Beach")

kristys_destination = kristy.destinations.build(city: "Colorado Springs")
kristys_destination.save
