sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hi there. who are you?  What are you doing here? Oh I'm one of Vornol's four apprentices.  I specialize in the element of earth.'"); }
  if ($text=~/Gazoon sent me/i) {
    quest::say("Oh you've been to see Gazoon on his island. Yep he gave me some of his fancy finger waggler armor, are ya a wizard?");
      }
  if ($text=~/wizard/i) {
    quest::say("Cool then you'll probably be wanting the [mask], [cloak], [gloves], [choker], [belt] and [staff] I have.");
      }
  if ($text=~/mask/i) {
    quest::say("For the mask you'll have to get me a meteor jewel, a mark of potential, and an iron tipped wand.");
  }
  if ($text=~/cloak/i) {
    quest::say("For the cloak you'll have to get me an astral jewel, a mark of temper, a vial of firewater, and some iced nectar.");
  }
  if ($text=~/gloves/i) {
    quest::say("For the gloves you'll have to get me a sun jewel, a mark of might, and a book of solutions.");
  }
  if ($text=~/choker/i) {
    quest::say("For the choker you'll have to get me a moon jewel, a mark of destruction, and a stick of mastery.");
  }
  if ($text=~/belt/i) {
    quest::say("For the belt you'll have to get me a star jewel, a mark of thaumaturgy, a loop of energy, and a small magnifying lens.");
  }
  if ($text=~/staff/i) {
    quest::say("For the staff you'll have to get me a cloud jewel, a mark of detonation, opaque glasses, and a pyro wand.");
  }  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4736 => 1, 4735 => 1, 4738 => 1, 4490 => 1)) { #belt
    quest::summonitem(3721);
    quest::say("Ah! Now I can return to my studies!"); #made up
    quest::exp(75000);
  }
  elsif (plugin::check_handin(\%itemcount, 4374 => 1, 4489 => 1, 4737 => 1)) { #choker
    quest::summonitem(3720);
  }
  elsif (plugin::check_handin(\%itemcount, 4494 => 1, 4731 => 1, 4729 => 1, 4730 => 1)) { #cloak
    quest::summonitem(3718);
  }
  elsif (plugin::check_handin(\%itemcount, 4733 => 1, 4732 => 1, 4488 => 1)) { #gloves
    quest::summonitem(3719);
  }
  elsif (plugin::check_handin(\%itemcount, 4491 => 1, 4739 => 1, 4740 => 1, 5973 => 1)) { #staff
    quest::summonitem(3722);
  }
  elsif (plugin::check_handin(\%itemcount, 4728 => 1, 4727 => 1, 4493 => 1)) { #mask
    quest::summonitem(3717);
  }
}
#END of FILE Zone:twilight  ID:170130 -- Trizpo_Tobbnokcog 

