sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, citizen! Keep clear of the waterways which run through this grand city. For swimming they are not. Many times have playful broodlings fallen prey to the sharp teeth of barracudas.");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("So the legion has sent you to have me sign this order, eh? Nay. I shall not do so unless the messenger, you, gathers two barracuda teeth for me. Hand me the legion order when you hand me the two barracuda teeth and then your task shall be complete.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18244 => 1, 12465 => 2)) { #Legion Order (4 signed), Barracuda Tooth x 2
    quest::emote("grabs the barracuda teeth and attaches them to a necklace. 'Good. Now this barracuda charm shall keep me safe from slipping into the waters and becoming a feast for the barracuda. And you, take this legion order and be gone.'");
    quest::summonitem(18245); #Legion Order (5 signed)
    quest::faction(193,5); #Legion of Cabilis
    quest::faction(30,5); #Cabilis Residents
    quest::faction(282,5); #Scaled Mystics
    quest::faction(62,5); #Crusaders of Greenmist
    quest::faction(317,5); #Swift Tails
    quest::exp(800);
  }
  elsif (plugin::check_handin(\%itemcount, 18244 => 1)) {
    quest::say("You shall get my signature when I have the legion order and two barracuda teeth.");
    quest::summonitem(18244);
  }
  elsif (plugin::check_handin(\%itemcount, 12465 => 2)) {
    quest::say("You shall get my signature when I have the legion order and two barracuda teeth.");
    quest::summonitem(12465,2);
  }
  elsif (plugin::check_handin(\%itemcount, 12465 => 1)) {
    quest::say("You shall get my signature when I have the legion order and two barracuda teeth.");
    quest::summonitem(12465);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabeast  ID:5131 -- Trooper_Nishnish