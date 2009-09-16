###################################
#Zone: Ak'anon                    #
#Short Name: akanon               #
#Zone ID:  55                     #
###################################
#NPC Name:Kaxon_Frennor           #
#NPC ID:  55122                   #
#Author:Soulz                     #
###################################

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say ("Hail $name. I am Kaxon Frennor, master assassin of the Dark Reflection. I train talented gnomes that feel the calling of the Plaguelord, Bertoxxulous, and wish to [serve as a rogue] of the Dark Reflection. Disease and decay are powerful forces in Norrath that crumble kingdoms and silently kill even the mightiest of heros. It is the calling of the Dark Reflection to sow the seeds of destruction as a catalyst to change. What progress would there be if rulers did not die and clockworks did not malfunction, giving way to greater rulers and better clockworks.");
  }
  if ($text=~/serve as a rogue/i) {
    quest::say ("We are the spreaders of disease, the masters of poison, the death that comes silently from the shadows. You must outfit yourself with the tools of a rogue, crafted from the disassembled remains of clockworks that are finished serving the purpose for which they were built. Take this parchment to Rebbie Romblerum, he will assist you in the construction of a suit of armor. When you have been properly outfitted return to me for your [next task].");
    quest::summonitem(10988);
  }
  if ($text=~/next task/i) {
    quest::say ("There are many of our kind that do not understand the necessity of the Dark Reflection. The Eldrich Collective and The Deep Muses seek to root us out and have us put to death or exiled from Ak'Anon. In the Steamfont Mountains a Rogue of the Deep Muses, Jibble Blexnik, has been hunting and killing young members of the Dark Reflection that venture from Ak'Anon. Find this self-righteous rogue and eliminate him. When you have accomplished this task bring me Jibble's Stiletto.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10992 => 1)) {
    quest::say("You have done well $name, here is your reward."); #unable to locate real reward text.
    quest::summonitem(11079);
    quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount, 18705 => 1)) {
   quest::say("Thanks.");
   quest::summonitem(13518);
   quest::exp(100);
  }
  else {
    #Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
#End of file