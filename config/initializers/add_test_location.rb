# init two test location if table exists
if ActiveRecord::Base.connection.table_exists?('locations') && Location.all.empty?
  l1 = Location.create(name: "Test Location 1", code: 0001)
  l2 = Location.create(name: "Test Location 2", code: 0002)
end
