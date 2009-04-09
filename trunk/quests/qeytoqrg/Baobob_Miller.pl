###################################
# Baobob_Miller.pl
#
# Quests: Wolf-hide armor
# Zone: Qeynos Hills (qeytoqrg)
#
# Turn-in Items: 
# Low Quality Wolf Skin ID-13753 and 5 gold pieces
# Medium Quality Wolf Skin ID-13754 and 15 gold pieces
# High Quality Wolf Skin ID-13755 and 21 gold pieces
#
# Rewards: 
# Wolf-hide Belt ID-2907
# Wolf-hide Boots ID-2906
# Wolf-hide Cape ID-2905
#
#

sub EVENT_SPAWN {
   quest::settimer(1,10);
}

sub EVENT_TIMER {
   if($timer eq "1") {
   $npc->SetAppearance(1);
   quest::stoptimer(1);
   }
} 

sub EVENT_AGGRO {
   quest::say("I can take on a whole pack of wolves. You will not be as much trouble.");
}

sub EVENT_SAY {

   if ($faction <= 8) { # Need dubious or better (not sure this is correct).

      if ($text=~/Hail/i) {
         quest::say("Hello, there. My name is Baobob Miller. My [sister] and I are the best tanners in all of Norath. Wolves are my specialty. A nice wolf skin [garment] would be the perfect accessory to your 

stylish ensemble.");
      }

      if ($text=~/what sister/i) {
         quest::say("My little sister Chanda is the second best tanner around!. Seriously though, she is a very skilled artisan and people travel far and wide to acquire one of her fine bear skin cloaks. I 

am proud of her. She doesn't really like to meet new people, but if you tell her [Baobob sent you], I am sure she can help get you into some nice bear skin boots.");
      }

      if ($text=~/what garment/i) {
         quest::say("I make the finest wolf skin [boots],[cloaks] and [belts] in all of Antonica.");
      }

      if ($text=~/what boot/i) {
         quest::say("If you can bring me a wolf skin of medium quality and pay me a fee of say.. hmmmm.. for you.. 15 gold pieces, I think I can make you a pair of boots that will make all of Qeynos envy 

you.");
      }

      if ($text=~/what cloak/i) {
         quest::say("Yes! One of my wold skin cloaks would go very well with your.. eeerr.. style.. Ahem! Let's see.. I think I can get you into one for 21 gold pieces, but, you have to provide the skin, and 

I make my cloaks with only the highest quality wolf skins.");
      }

      if ($text=~/what belt/i) {
         quest::say("Belts are far more forgiving than cloaks or boots. A lesser quality pelt and 5 gold pieces would get you a nice wolf-hide belt.");
      }

   } else {
      quest::say("Hmm.. I really would not feel comfortable helping you in that way. You need to prove yourself to me by aiding my friends and family in the Plains of Karana before I will help you.");
   }
}

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount, 13753 => 1) && $gold == 5) {

      quest::say("Good work! Now have you the rest of what I require?");
      quest::say("I hate working with such low quality hides. They lack the sheen that makes a high quality pelt look so fine!");
      quest::say("Anyhow, here's your belt.");
      quest::summonitem(2907);
      $give_faction = 1;

   } elsif (plugin::check_handin(\%itemcount, 13754 => 1) && $gold == 15) {

      quest::say("Good work! Now have you the rest of what I require?");
      quest::say("They are exquisite, if I do say so myself. Hope they fit.");
      quest::summonitem(2906);
      $give_faction = 1;

   } elsif (plugin::check_handin(\%itemcount, 13755 => 1) && $gold == 21) {

      quest::say("Good work! Now have you the rest of what I require?");
      quest::say("Here ya go! That should keep ya nice and warm! Be sure to tell all the friends you're going to impress where you got this fine cloak. Although I am sure they probably have heard of me 

already.");
      quest::summonitem(2905);
      $give_faction = 1;

   } else {
      plugin::return_items(\%itemcount);
   }

   if ($give_faction == 1) {
      quest::faction("167","1"); # +Karana Residents
      quest::faction("135","1"); # +Guards of Qeynos
      quest::faction("257","1"); # +Priests of Life
      quest::faction("183","1"); # +Knights of Thunder
   }

}

#END of FILE Zone:qeytoqrg  -- Baobob_Miller