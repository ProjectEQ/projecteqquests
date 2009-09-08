sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail! So you think you are a mighty Knight of Shadows? We must test these skills. Are you ready to begin the test?  Or do you think you have already proof of your deeds?");
  }
  if($text=~/ready/i) {
    quest::say("Great, let us waste no more time! I offer to you three challenges: Bash, smash, or slash. What do you wish to be tested in?");
  }
  if ($text=~/bash/i) { #shadowknight test of bash
    quest::say("Gragrot like bashin. Gragrot say you like bashin too! Give Gragrot an Ebon Tessera, a Sphinx Eye Opal, and a Finely Crafted Amulet. Gragrot then give you Sphinx Eye Amulet.");
  }
  if ($text=~/smash/i) { #shadowknight test of smash
    quest::say("Gragrot wants you smashin. Smash, smash, and return a Copper Disk, a Small Sapphire, and a Silvery Ring. Then Gragrot give you Djinni's Finger Ring.");
  }
  if ($text=~/slash/i) { #shadowknight test of slash
    quest::say("Gragrot see you is powerful, but Gragrot wonders if you is good at Slashin. Gragrot says return with a Diaphanous Globe, a piece of dried leather, and a Finely Woven Cloth Belt. Gragrot then give you pegasus hide belt.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20929 => 1, 20997 => 1, 20998 => 1)) { #shadowknight test of bash using ebon tessera, sphinx eye opal, finely crafted amulet
    quest::summonitem(14554); #sphinx eye amulet
    quest::exp(100000);
    quest::say("You is powerful! Take this!");
    quest::depop();
  }
  elsif(plugin::check_handin(\%itemcount, 20936 => 1, 20999 => 1, 20700 => 1)) { #shadowknight test of smash using copper disc, small sapphire, silvery ring
    quest::summonitem(14553); #Djinni finger ring
    quest::exp(100000);
    quest::say("You is powerful! Take this!");
    quest::depop();
  }
  elsif(plugin::check_handin(\%itemcount, 20943 => 1, 20701 => 1, 20702 => 1)) { #shadowknight test of slash using diaphanous globe, dried leather, finely woven cloth belt
    quest::summonitem(2704); #pegasus-hide belt
    quest::exp(100000);
    quest::say("You is powerful! Take this!");
    quest::depop();
  }
  else {
    quest::say("What is these for?");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
}