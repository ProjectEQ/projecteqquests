#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Supreme Laochsmith Psorin
#NPC ID: 114249
#Quest Status: finished
#
# items: 31140, 31528, 31119, 31526, 31133, 31527, 31098, 31525, 31182, 31529, 26025, 2612, 25194, 2611, 30507, 2610

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("It is most unfortunate that you do not have scales to defend your fragile mortal shell, $race, I can only hope that the armor we in the Shrine can provide you with will extend your life another fraction of a century. In addition to that you also might want a [special helm] to cover up that scaleless face of yours. I understand that the Mother could not grace you with all our blessings, but at least we can try to make you look half-way decent.");
  }
  if ($text=~/special helm/i) {
    quest::say("Using my obviously superior skills I can customize a plate helm from the Shrine to suit a $race such as yourself. Give me your Blood Lord's Crown, Scaled Knight's Helm, Helm of Twilight, Akkirus' Crown of the Risen, Cowl of Mortality, Frostreaver's Velium Crown, Crown of the Kromzek Kings, or Crown of the Myrmidon and I shall make you a new helm that will better hide and protect your unscaled features.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31140 => 1)) {
    quest::say("Thank you, $name. Please accept this Helm as a token of our gratitude for your service to the Shrine.");
    quest::summonitem(31528); # Item: Akkirus' Custom Crown of the Risen
  }
  elsif (plugin::check_handin(\%itemcount, 31119 => 1)) {
    quest::say("Thank you, $name. Please accept this Helm as a token of our gratitude for your service to the Shrine.");
    quest::summonitem(31526); # Item: Custom Scaled Knight's Helm
  }
  elsif (plugin::check_handin(\%itemcount, 31133 => 1)) {
    quest::say("Thank you, $name. Please accept this Helm as a token of our gratitude for your service to the Shrine.");
    quest::summonitem(31527); # Item: Custom Helm of Twilight
  }
  elsif (plugin::check_handin(\%itemcount, 31098 => 1)) {
    quest::say("Thank you, $name. Please accept this Helm as a token of our gratitude for your service to the Shrine.");
    quest::summonitem(31525); # Item: Custom Blood Lord's Crown
  }
  elsif (plugin::check_handin(\%itemcount, 31182 => 1)) {
    quest::say("Thank you, $name. Please accept this Helm as a token of our gratitude for your service to the Shrine.");
    quest::summonitem(31529); # Item: Custom Crown of the Myrmidon
  }
  elsif (plugin::check_handin(\%itemcount, 26025 => 1)) {
    quest::say("Thank you, $name. Please accept this Helm as a token of our gratitude for your service to the Shrine.");
    quest::summonitem(2612); # Item: Custom Cowl of Mortality
  }
  elsif (plugin::check_handin(\%itemcount, 25194 => 1)) {
    quest::say("Thank you, $name. Please accept this Helm as a token of our gratitude for your service to the Shrine.");
    quest::summonitem(2611); # Item: Custom Crown of the Kromzek Kings
  }
  elsif (plugin::check_handin(\%itemcount, 30507 => 1)) {
    quest::say("Thank you, $name. Please accept this Helm as a token of our gratitude for your service to the Shrine.");
    quest::summonitem(2610); # Item: Custom Frostreaver's Velium Crown
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone: skyshrine ID: -- Supreme_Laochsmith_Psorin