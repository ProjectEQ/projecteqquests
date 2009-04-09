###########################################
#
# DEVELOPER: KOVOU
#
# *** NPC INFORMATION ***
#
# NAME: Bella Stremi
# ID: 170150
# ZONE: twilight
#
############################################

sub EVENT_SAY {
 if($text =~/hail/i) {
	quest::say("Ah hello and welcome $name. tis a pleasure to see some new faces.  I have the finest wares to be found. be sure to check them out. Are ya by chance a [necromancer]");
 }
 if($text =~ /necromancer/i) {
	quest::say("I have a cap, robes, sleeves, pants, shawl, bracer, and sandals for a necromancer. Frantip has the rest just ask him about armor and I'm sure he'll help you. Which are you interested in?");
 }
 if($text =~ /cap/i) {
	quest::say("For the cap of pestilence you'll have to bring me a sky jewel, an aged gold coin, a dark gem, and a priceless book.");
 }
 if($text =~ /robe/i) {
	quest::say("For the robe of pestilence you'll have to bring me a meteor jewel, a miniature armband, a mark of fortune, and a sun wraith eye.");
 }
 if($text =~ /sleeves/i) {
	quest::say("For the sleeves of pestilence you'll have to bring me an astral jewel, a petrified totem, a frozen hailstone, and a glowing crystal.");
 }
 if($text =~ /pants/i) {
	quest::say("For the pants of pestilence you'll have to bring me a sun jewel, a divining rod, an aged platinum symbol, and a silver sign.");
 }
 if($text =~ /shawl/i) {
	quest::say("For the shawl of pestilence you'll have to bring me a moon jewel an ancient fossil, and some wrought iron shavings.");
 }
 if($text =~ /bracer/i) {
	quest::say("For the bracer of pestilence you'll have to bring me a star jewel, a granite idol, and an ancient silver coin.");
 }
 if($text =~ /sandals/i) {
	quest::say("For the sandals of pestilence you'll have to bring me a cloud jewel, a blackened ornament, and a snake scale sceptre.");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 4492 => 1, 4741 => 1, 4742 => 1, 4743 => 1)) { #cap
    quest::summonitem(3723);
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4493 => 1, 4744 => 1, 4745 => 1, 4746 => 1)) { #robe
    quest::summonitem(3724);
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4494 => 1, 4748 => 1, 4749 => 1, 4750 => 1)) { #sleeves
    quest::summonitem(3725);
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4488 => 1, 4751 => 1, 4752 => 1, 4753 => 1)) { #pants
    quest::summonitem(3726);
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4489 => 1, 4771 => 1, 4772 => 1)) { #shawl
    quest::summonitem(3727);
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4490 => 1, 4773 => 1, 4774 => 1)) { #bracer
    quest::summonitem(3728);
    quest::exp(10000);
     }
 if (plugin::check_handin(\%itemcount, 4491 => 1, 4775 => 1, 4776 => 1)) { #sandals
    quest::summonitem(3729);
    quest::exp(10000);
     } 
 else{
     plugin::return_items(\%itemcount);
    }
}

#END of FILE 



