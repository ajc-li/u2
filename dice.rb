def roll_dice(num_dice=1)
   sum=0
     num_dice.times do 
       sum=rand(1..6)
     end
   sum
 end
 
 def dice_outcomes(num_dice=1, rolled_times)
   outcomes={}
   (num_dice..num_dice*6).each do |outcome|
     outcomes[outcome]=""
   end
   rolled_times.times do
     sum=0
     num_dice.times do
       sum=rand(1..6)
     end
     outcomes[sum]="*"
   end
   outcomes.each do |outcome, times|
     if outcome<10
       puts "#{outcome}:  #{times}"
     else
       puts"#{outcome}: #{times}"
     end
   end
 end

 dice_outcomes(2)
 dice_outcomes(4)