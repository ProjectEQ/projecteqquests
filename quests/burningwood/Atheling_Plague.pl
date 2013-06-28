#Quests covered in this file:
#Shaman Skull Quest 6

sub EVENT_SAY
{
   if($text=~/hail/i && $shmskullquest >= 8)
   {
      quest::say("Ahh!! A conversationalist. How good to meet you, Cradossk. Yes. I have heard of you. Go ahead and ask for that which has brought you to my tower and emboldened you to slay my weaker minions.");
   }
   if($text=~/Give me the skull of the sisters of scale/i && $shmskullquest >= 8)
   {
      quest::say("What a coincidence! I, too, seek a skull. Perhaps you might help me [obtain the skull]. Perhaps then you shall have the skull you desire.");
   }
   if($text=~/I will help you obtain the skull/i && $shmskullquest >= 8)
   {
      quest::say("I am sure you would not mind removing the head of a scaled mystic. I hope not. There is an old Iksar who once called me slave. Now he shall adorn my wall, mounted on a fine plaque. His name is Digalis. Find him. Do not return until your task is complete.");
   }
}

sub EVENT_ITEM
{
   $x = $npc->GetX();
   $y = $npc->GetY();
   $z = $npc->GetZ();
      #Turn in the Iksar Skull dropped off of an iksar slave in droga jail
   if(plugin::check_handin(\%itemcount, 12764 => 1) && $shmskullquest >= 8)
   {
      quest::summonitem(12750);
      quest::shout("Excellent. You show signs of a true Iksar slayer. Too, bad I have already given the skull of the Sister of Scale to another. Perhaps you would like to meet him before he departs. Say hello, Doval.");
      quest::unique_spawn(87154,0,0,$x + 5,$y,$z);
      quest::settimer("heal",20);
      #Atheling does heals clerk doval but does not attack
   }

   plugin::return_items(\%itemcount); #return items if not the ones required
}

sub EVENT_TIMER {
   if($timer eq "heal"){
       $npc->CastSpell(12,87154);
}
 }

sub EVENT_SIGNAL {
   if($signal == 1){
       quest::stoptimer("heal");
}
 }

sub EVENT_DEATH_COMPLETE {
   quest::stoptimer("heal");
}