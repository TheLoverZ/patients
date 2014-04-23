module LocationsHelper

  def all_locations_for_select_tag
    locations = []
    Location.all.each { |l| locations << [l.name, l.id] }
    locations
  end

end
