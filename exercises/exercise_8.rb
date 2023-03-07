require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_6'

# Make sure non-empty stores cannot be destroyed
@store1 = Store.first
if @store1.destroy
  puts "Store destroyed! It has #{@store1.employees.size} =/"
else
  puts "Could not destroy store :)"
end

# Make sure empty stores can be destroyed
@empty_store = Store.create!(name: 'Test Empty Store', annual_revenue: 0, womens_apparel: true)
if @empty_store.destroy
  puts "Empty Store destroyed! This is good"
else
  puts "Whoa! Empty store should be destroyable... Not cool!"
end