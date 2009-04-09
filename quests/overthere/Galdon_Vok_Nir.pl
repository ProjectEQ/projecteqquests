sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Please do not harm me.  I am not the one who brought the outsiders to our land.  I am innocent and deserve to return to my people."); 
}   
if($text=~/What will you trade for the skull of Di Nozok?/i && $shmskullquest >= 7){
      quest::say("Ah, doing the bidding of the council are you?  I will only give up the skull for the 2 Ton Warrior Totems held by the goblins of nurga and frogloks of the swamp of no sarrow, the Canopie of Di Nozok held by the goblin Overseer Dlubish, and 400 gold pieces.");
   }
}

sub EVENT_ITEM
{
   #Turn in the 2 totems and the canopie of Di Nozok and 400 gold pieces
   if(plugin::check_handin(\%itemcount, 12743 => 1, 12744 => 1, 12742 => 1) && $gold == 400 && $shmskullquest >= 7)
   {
      quest::say("A deal is a deal I suppose, many have attempt to do what I have asked, but fallen to the Overseer.");
      quest::summonitem(12740); #Give the player the Iksar Skull
   }

   plugin::return_items(\%itemcount); #return items if not the ones required
}

#END of FILE Zone:overthere  ID:93140 -- Galdon_Vok_Nir 

