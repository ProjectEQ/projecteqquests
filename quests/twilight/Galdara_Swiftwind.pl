############################################

# DEVELOPER: KOVOU

#

# *** NPC INFORMATION ***

#

# NAME: Galdara Swiftwind 

# ID: 170129
# ZONE: twilight
############################################

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Hi Hi, Im one of master Vornol's four apprentices. My specialty is with all things concerning the element of air.");
 }
 if($text =~ /armor/i) {
	quest::say("You must have spoken with master Vornol. He has me keeping this armor for him and various tasks for those to do who wish to wear it. Tell me are you a magician?");
 }
 if($text =~ /i am a magician/i) {
	quest::say("Very good, the pieces that I have are the sandals, mask, cloak, gloves, choker, belt, and a staff.");
 }
 if($text =~ /sandals/i) {
	quest::say("For the sandals you must bring me an astral jewel, a talisman of wind, and a mark of aeration.");
 }
 if($text =~ /mask/i) {
	quest::say("For the mask you must bring me a sun jewel, a talisman of earth, and a sack of shadowed soil.");
 }
 if($text =~ /cloak/i) {
	quest::say("For the cloak you must bring me a moon jewel, a water idol, a water marked scroll, and a runed ring of water.");
 }
 if($text =~ /gloves/i) {
	quest::say("For the gloves you must bring me a star jewel, petrified bones, and a vial of dark earth.");
 }
 if($text =~ /choker/i) {
	quest::say("For the choker you must bring me a cloud jewel, fiery gourd, and a flaming candle.");
 }
 if($text =~ /belt/i) {
	quest::say("For the belt you must bring me a sky jewel, a vial of the morning mist, fastened links and a water etched wand.");
 }
 if($text =~ /staff/i) {
	quest::say("For the staff you must me a meteor jewel, a fire etched wand, an earth etched wand, and an air etched wand.");
 }
}

sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 4494 => 1, 4586 => 1, 4587 => 1)) { #sandals

    quest::summonitem(3690);

    quest::exp(10000);   

  }

  if (plugin::check_handin(\%itemcount, 4488 => 1, 4588 => 1, 4589 => 1)) { #mask

    quest::summonitem(3691);

    quest::exp(10000);   

  }

  if (plugin::check_handin(\%itemcount, 4489 => 1, 4597 => 1, 4598 => 1, 4599 => 1)) { #cloak

    quest::summonitem(3692);

    quest::exp(10000);   

  }

  if (plugin::check_handin(\%itemcount, 4490 => 1, 4600 => 1, 4601 => 1)) { #gloves

    quest::summonitem(3693);

    quest::exp(10000);   

  }

  if (plugin::check_handin(\%itemcount, 4491 => 1, 4602 => 1, 4603 => 1)) { #choker

    quest::summonitem(3694);

    quest::exp(10000);   

  }

  if (plugin::check_handin(\%itemcount, 4492 => 1, 4604 => 1, 4828 => 1, 4605 => 1)) { #belt

    quest::summonitem(3695);

    quest::exp(10000);   

  }

  if (plugin::check_handin(\%itemcount, 4493 => 1, 4672 => 1, 4674 => 1, 4673 => 1)) { #staff

    quest::summonitem(3696);

    quest::exp(10000);   

  }

  else{ 

    plugin::return_items(\%itemcount);

    }

}

#END of FILE