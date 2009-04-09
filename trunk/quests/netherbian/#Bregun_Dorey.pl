# Bregun Dorey is spawned in Netherbian when you give a dawnshroud cinder to legionnaire Dalini

sub EVENT_SAY{
  if ($text=~/hail/i){
    quest::say("Trog trog trog trog?");
  }
  if ($text=~/trog/i) {
    quest::say("Ha! What are you talking about?! Strange thing you are. Wait a minute, come closer. Are you [from Norrath]?");
  }
  if ($text=~/from norrath/i) {
    quest::say("I thought so, your armor looks to be made from things found not here. Have you heard of [Rivervale]?");
  }
  if ($text=~/Rivervale/i) {
    quest::say("[Good].");
  }
  if ($text=~/good/i) {
    quest::say("Yeah good! Trog trog trog trog! Hahaha! These Troglodytes don't know of Rivervale. They just run around the cave all day doing Troglodyte things. Hahaha! Trog trog trog. So what was I speaking of.. Oh Bixies! So, are there [bixies around Rivervale]?");
  }
  if ($text=~/bixies around rivervale/i) {
    quest::say("There are Bixies! THERE ARE BIXIES! This is great. You should hunt some Bixies, and get some Bixie parts. Then you can make me some Bixie Crunchies! Ooooh, Crunchies. I want to try the Crunchies. I think you should bring me four Crunchies!");
  }
}

sub EVENT_ITEM{
  # bixes crunchies : These are baked by putting one bixie part and one frosting in an oven. Bixie parts are a semi-rare drop off bixies, and frosting is sold at the baking vendors. The Crunchies are Trivial at skill 46. 
  if (plugin::check_handin(\%itemcount,13464=>4)) { # 4 bixie crunchies
    quest::say("Ah hum!");
    # returns a bixie charm
    quest::summonitem(29852); 
    quest::say("Give this charm to Torsten as a present from his old friend.");
  }
  
  # give the note from Torsten (Sealed Note to Bregun)
  if (plugin::check_handin(\%itemcount,29853=>1)) { # 1 sealed note to bregun
    quest::say("Hahaha! Silly Torsten. Always snooping over my shoulder. Well I have nothing to lose... Take this to him, it's directions on how to find the Journal I kept. I hid it where no one would look! Haha! Trog trog trog!");
    quest::summonitem(29854); # bregun's directions
    quest::depop();
  }
  
  plugin::return_items(\%itemcount);
}

