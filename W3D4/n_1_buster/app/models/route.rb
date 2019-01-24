class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    buses_with_drivers = self.buses.includes(:drivers).select("buses.*, drivers*")

    all_drivers = Hash.new {|h,k| h[k]= []}

    buses_with_drivers.each do |bus_with_driver|
      all_drivers[bus_with_driver.bus_id] << bus_with_driver.name
    end

    all_drivers
  end
end
