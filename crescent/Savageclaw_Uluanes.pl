sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("To command a beast, you must first respect it. That is the nature of the Savageclaw Primalists. With that respect you can tap into the true feral nature of the beast and it becomes an even greater foe than it was before the beastlord's magic.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Beastlord") && (plugin::check_handin(\%itemcount, 58661 => 1))) { #Crescent Reach Guild Summons
    quest::say("Welcome, young beastlord! You are now a member of the Savageclaw Primalists. The drakkin are kind enough to host our kind here as none of them know the art of the beastlord. So here we remain teaching and training all beastlords who wish to support Crescent Reach and the drakkin who live here. Take this tunic of our guild and wear it well. Also, see Innkeeper Fathus and Initiate Dakkan. They have work for you to do. Return to me whenever you might need further training.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58765); #Savageclaw Primalists Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}