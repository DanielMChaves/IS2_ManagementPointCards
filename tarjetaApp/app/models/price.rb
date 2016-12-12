class Price < ActiveRecord::Base
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
end
