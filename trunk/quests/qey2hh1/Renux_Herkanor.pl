#Grandmaster Assassin's Seal
#Zone: West Karana
#Short Name: qey2hh1
#Zone ID: 12
#
#NPC Name: Renux Herkanor
#NPC ID: 12032

sub EVENT_SAY {
  $makepoison = $client->GetSkill(56);
  if ($faction <= 2 && $makepoison >= 278) {
    if($text=~/Hail/i) {
      quest::say("Master Hanns is going to kill me! I let that dark assassin look at his prized poison collection and he lifted it all when I wasn't looking! He even snatched his Grandmaster's Vial! Master Hanns was so furious he grabbed one of his old blades from his collection and jabbed it at the wall so hard it shattered! I really need some help replacing all that was [ruined] or I have a feeling Master Hanns is going to send me on a suicide mission!");
    }
    if($text=~/ruined/i) {
      quest::say("Fantastic! I need to replace all those old poisons, the vial and that old scareling blade. I think the bottles had the following written on them Bane, Burn, Essence, Sloth, Rage, Swiftness, Disorientation, and Dimethyl. Please hurry!");
      quest::summonitem(17148);
    }
  }
  else {
    quest::say("Go away! We don't have time for the likes of you.");
  }
} 

sub EVENT_ITEM {
  $makepoison = $client->GetSkill(56);
  if ($faction <= 2 && $makepoison >= 278) {
    if (plugin::check_handin(\%itemcount, 24072 => 1)) {
      quest::say("Great! Looks like everything is here! Hopefully Master Hanns won't send me to Steamfront now, I have a really bad feeling about that assignment. Here take this Seal, it was dropped by that dark stranger. It glows with a dark power I just don't understand. Be wary of further sightings of that dark assassin.");
      quest::summonitem(24073);
      quest::exp(200000);
      quest::faction(33,20); # Circle Of Unseen Hands
      quest::faction(217,-20); # Merchants of Qeynos
      quest::faction(53,20); # Corrupt Qeynos Guards
      quest::faction(135,-20); # Guards of Qeynos
      quest::faction(164,20); # Kane Bayle
      quest::depop_withtimer();
    }
    else {
      plugin::return_items(\%itemcount);
    }
  }
  else {
    quest::say("Go away! We don't have time for the likes of you.");
  }
}
#END of FILE zone: ID:12 -- Renux_Herkanor.pl