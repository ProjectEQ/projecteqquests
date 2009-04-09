
#Quests covered in this file:
#Shaman Skull Quest 6

sub EVENT_DEATH
{
   quest::shout("the river of Xinth...");
}

sub EVENT_ITEM
{
   #Turn in the a potion of swirling liquid
   if(plugin::check_handin(\%itemcount, 12752 => 1) && $shmskullquest >= 8)
   {
      quest::summonitem(12750);#give the player on of the Iksar skulls of the sisters...
      quest::shout("Go to where the pines have been smashed. Must reach great heights!");
      quest::depop();
      # an npc named, Friend Vagnar the Channeler, is supposed to spawn and shout that text while running away, figure this would b easier on the server...
   }

   plugin::return_items(\%itemcount); #return items if not the ones required
}