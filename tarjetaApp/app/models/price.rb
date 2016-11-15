class Price < ActiveRecord::Base

   # Default values
   before_create :set_default_values

   def change_status(status)
     self.status = 0
   end

   def change_requirement(requirement)
     self.requirement = requirement
   end

   def increase_lot
     self.lot += 1

     if self.lot == 1
       change_status(true)
     end
   end

   def decrease_lot
     self.lot -= 1

     if self.lot == 0
       change_status(false)
     end
   end

   def set_default_values
     self.status = false
     self.requirement = 0
     self.lot = 0
   end
end
