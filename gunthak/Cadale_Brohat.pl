#zone: gunthak NPC: Cadale Brohat (29060)
#Provocating

sub EVENT_SAY {
if ($text=~/Hail/i){
      quest::emote("smiles widely at you. 'Welcome. You are brave to venture to Broken Skull Rock. Don't mind the others. Everyone is a bit touchy around here. If you are interested in dyes, feel free to peruse what I have to offer. Playing with them has given me hours of entertainment! Just be careful on this rock, and watch your back. Oh, before I forget, I'm looking for someone to help me with some [tasks] that I need to get done. All my time with the dyes has kept me from some of the more important things I need to take care of.'");
   }
    if ($text=~/task/i)
   {
      my @task_array;
      push(@task_array, 500223); #Pray for Life
      push(@task_array, 3749); #Time for Bed
      push(@task_array, 192); #Ahoy, Ye Bony Mate
      push(@task_array, 546); #Brains Over Brawn
      push(@task_array, 4175); #Don't Be Scared
      push(@task_array, 4069); #Gathering Skin    [
      push(@task_array, 4428); #Underhanded Exploration
      push(@task_array, 4536); #Find the Ore
         
      quest::taskselector(@task_array);
   }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}