# items: 2877, 3455, 3456, 3459, 3460, 3464, 2878, 3466, 3465
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name. It is my pleasure to meet you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 2877 => 1)) {
    quest::say("Ahh, $name, I was told you'd be coming. I am Harbin, and I will oversee the next bit of your progress in the Taruun. You have bravely chosen a path that will put your every skill to the test. May your abilities be honed in the service of the noble Vah Shir. To begin, bring me the soft chitin of three of the Rhinobeetles that dwell in the crater surrounding our city.");
    quest::summonitem(2877); # Item: Acrylia Slate of Shar Vahl
  }
  elsif (plugin::check_handin(\%itemcount, 3455 => 3)) {
    quest::emote("Harbin Gernawl takes the chitin and deftly fashions a buckler as he speaks, 'Your progress will be reported, $name. For your effort thus far I present you with this buckler. It will help to protect you until you become adept enough to wield a weapon in each of your hands. Meanwhile, it is time for you to practice the skill that Shar Vahl relies on to feed it's people. Following this recipe, deliver four boiled rockhopper eggs to Sergeant Tylah in Hollowshade moor. Return to me with the acrylia he will pay you.'");
    quest::summonitem(3456); # Item: Buckler of the Beetle
  }
  elsif (plugin::check_handin(\%itemcount, 3459 => 1)) {
    quest::say("Your progress will be rewarded, $name. Soon all will recognize you as a recruit of the cunning Taruun! Speak with Merchant Rytan. When he is through with you return to me with his seal, your buckler, your initiate's cloak and this seal.");
    quest::summonitem(3460); # Item: Initiate Seal of the Taruun
  }
  elsif (plugin::check_handin(\%itemcount, 3460 => 1, 3464 => 1,  2878 => 1, 3456 => 1)) {
    quest::say("Your hard work is pleasing to the Taruun, $name, which now accepts you as an official recruit. Wear this cloak with pride. Your buckler has been treated with a special epoxy and should protect you more effectively now. Show the buckler to Taruun Joharr and he will continue to guide you on your sacred path. I sense a strong spirit in you, young one. May it guide you to greatness!");
    quest::summonitem(3466); # Item: Hardened Buckler of the Beetle
    quest::summonitem(3465); # Item: Cloak of the Taruun Recruit
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155079 -- Harbin_Gernawl 