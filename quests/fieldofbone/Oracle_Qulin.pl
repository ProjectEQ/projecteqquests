#Quests covered in this file:
#Shaman Skull Quest 7

sub EVENT_ITEM
{
   #Turn in the a dusty iksar skull
   if(plugin::check_handin(\%itemcount, 30984 => 1) && $faction <= 5 && $shmskullquest >= 10)
   {
      quest::say("Granix did well to send you to me, I may yet be able to recover the spirit of this ancient and set it free. Come! I shall need your help with this ritual.");
      quest::summonitem(30984); #give the skull back incase you fail
      my $x = $npc->GetX();
      my $y = $npc->GetY();
      my $z = $npc->GetZ();
      my $h = $npc->GetHeading();
      quest::spawn2(78215,0,0,$x + 5,$y,$z,$h);#spawn An Arisen Iksar
   }

   #Turn in the Wet Skull Fragments
   if(plugin::check_handin(\%itemcount, 30985 => 1) && $faction <= 5 && $shmskullquest >= 10)
   {
      quest::say("It seems this particular ancient does not wish to be put to rest. Return this note to Hierophant Granix and tell him what happened. He will surely wish this skull to be disposed of properly, but I do not have the power to do it myself.");
      quest::setglobal("shmskullquest", 11,5,"F"); #set a global flag so that user can do shm skull quest part 7.4
      quest::summonitem(30986); #note to Hierophant Granix
   }

  plugin::return_items(\%itemcount);
}