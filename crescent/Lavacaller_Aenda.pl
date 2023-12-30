sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("From the earth, air, and water we summon creatures to protect us and from fire we call destruction! Few truly appreciate the complexities of a magician, but we of the Ring of the Elements truly appreciate these gifts.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Magician") && (plugin::check_handin(\%itemcount, 58659 => 1))) { #Crescent Reach Guild Summons
    quest::say("To become a member of the Ring of the Elements is a great honor. We are a guild of masters of the magicians' gifts. There is no greater guild that will help you learn the ways of this art. Take this Robe of the Ring and wear it well and proud. Return to me whenever you need training. I'm eager to see you progress! Also, stop by and see Innkeeper Fathus and Initiate Dakkan. They have plenty of work that needs to be done. Udra, $name. I hope to see you soon.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58763); #Ring of the Elements Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}