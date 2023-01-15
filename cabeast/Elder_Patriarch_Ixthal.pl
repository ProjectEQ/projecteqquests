# items: 48060, 12844, 12845, 12633, 48045, 48046, 48051, 48047, 48061, 48048, 48064, 48065, 48066, 48067, 48049
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("'Hello to you as well. I am Elder Patriarch Ixthal and I continue training when the Prime Patriarch becomes overwhelmed with duties. I will train you if you seek to one day [become a Patriarch of Cabilis].");
  }
  if ($text=~/become a patriarch of cabilis/i) {
    quest::say("I thought you might. I can sense your spirit is strong. For your first mission, you will need to use the spirits to guide you to collect some [rare items] we need on a daily basis in order to keep up with the demands of the city. This mission will also be great [training] for you.");
  }
  if ($text=~/rare items/i) {
    quest::say("We gather several items that we trade with the Hierophants. These items include a cracked femur, creeper cabbage, and lichenclover. Once you have all of these items, return them to me with your Claw of the Cub and you shall be rewarded.");
  }
  if ($text=~/continue training/i) {
    quest::say("That's the spirit. For your next task we will require you to show your skills at locating a [missing member] of the Patriarchs of Cabilis.");
  }
  if ($text=~/missing member/i) {
    quest::say("His name is Welgaz and he tends to roam the continent in search of a perfect training area. We have not heard back from him in a while now and we grow worried. You must now go forth and find him. Tell him I have sent you to find him.");
  }
  if ($text=~/aid our cause/i) {
    quest::say("I thought you may, $name. We have an issue at hand that you may be able to help with. It seems as though there are rumors of the sarnak factions gathering forces. We must find out all the information we can regarding this situation. Travel to the kly's and seek what they know. Place all of their letters in this tome, which shall combine their mystical energies. Bring back the completed message to me with your claw of the apprentice and you will be rewarded.");
    quest::summonitem(48060); # Item: Spiritual Tome
  }
  if ($text=~/attack/i) {
    quest::say("I have heard of no such attacks. We are safe within these walls. Zreezas is just paranoid.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12844 => 1, 12845 => 1, 12633 => 1, 48045 => 1)) {
   quest::say("You have returned unharmed with the items I asked for. Here is your reward now. If you wish to [continue training] please let me know.");
   quest::summonitem(48046); # Item: Claw of the Scout
   quest::exp(1000);
   quest::ding();
  }
  elsif (plugin::check_handin(\%itemcount, 48051 => 1, 48046 => 1)) {
    quest::say("Because of you, we now know that Welgaz is safe and will be returning to us shortly. Take this to represent our appreciation for your deeds completed here today. Please return soon once you have decided to [aid the cause].");
    quest::summonitem(48047); # Item: Claw of the Apprentice
    quest::exp(2000);
    quest::ding();
  }
  elsif (plugin::check_handin(\%itemcount, 48061 => 1, 48047 => 1)) {
    quest::say("I see you have returned with the information asked. Hmm . . . this doesn't bode well. I will need some time to think about the situation now. Take this and wear it proudly. You are a Young Patriarch now.");
    quest::exp(4000);
    quest::summonitem(48048); # Item: Claw of the Young Patriarch
    quest::ding();
  }
  elsif (plugin::check_handin(\%itemcount, 48064 => 1)) {
    quest::say("I can't believe this! We have a traitor in our midst after all... Thanks to you, Young Patriarch, we seem to have a headstart. You should go find rankings from three close to the traitor so that they may reveal his location. Bring me the proof about the location of the trader and you shall be rewarded.");
    quest::exp(10000);
  }
  elsif (plugin::check_handin(\%itemcount, 48065 => 1, 48066 => 1, 48067 => 1, 48048 => 1)) { #Symbol of Lativ (Burning Woods, Dreadlands, Frontier Mountains), Claw of the Young Patriarch
    quest::say("Excellent work, $name. You have proven yourself well. I hope you did not show them any mercy... I think you have matured and you deserve to be recognized for your bravery.");
    quest::summonitem(48049); #Claw of the Mature Patriarch
    quest::exp(25000);
  }
  plugin::return_items(\%itemcount);
}