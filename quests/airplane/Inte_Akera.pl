#Inte Akera, paladin Epic quest turn-in NPC

sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. I am Inte Akera. I have retired to the Plane of Sky after a long life toiling on Norrath's soil. Have you retreated here as well, or are you merely visiting?");
    }
  if ($text=~/toil/i) {
    quest::say("Long ago, before I came to this plane, I fought in the name of Prexus against all the evils that plagued Norrath. In that time, I have done everything one can do. I have fought for the causes of good. I gained the esteem of kings and lords. The sword I hold is but one example of the treasures I have sought and won. I have accomplished all that I can, have all that I desire. My toil is done and now I sit among the clouds in peace, occasionally blessing those who seek it and are found worthy.");
    }
  if ($text=~/blessing/i) {
    quest::say("Many come seeking my blessings. No matter how minor the blessing they ask, all must prove that they embody the qualities of a paladin before I bless them.");
    }
  if ($text=~/prove myself/i) {
    quest::say("I believe the two most important qualities of a paladin are nobility and sacrifice. Hand me an item of yours that proves you understand what nobility and sacrifice are. Be warned however, if I do not think as you do, I will simply accept the item as a gift, and give you no blessing.");
    }
  if ($text=~/nobility/i) {
    quest::say("Ah nobility. A true measure of a paladin. If you are wondering what to bring me, then perhaps you should look within yourself. Look into your soul for a great, burning fire of nobility and you will know.");
    }
  if ($text=~/sacrifice/i) {
    quest::say("Sacrifice is a virtue all paladins should strive for. The sacrifice of something dear to you will show your devotion. Perhaps something you use to smite the unholy undead.");
    }
  if ($text=~/accomplish/i) {
    quest::say("I accomplished many great deeds; far too many to name. I saved kings and kingdoms; I helped the weak and destitue; I accomplished all I sought to do, save one at which I failed.");
    }
  if ($text=~/failed/i) {
    quest::say("No.. I was unable to kill my most hated foe, Miragul. The head of this wretched, foul necromancer is forever out of the reach of justice. It would be worth restoring him to his former state for the chance to take his head as a trophy.");
    }
  if ($text=~/miragul/i) {
    quest::say("You think you can succeed where I cannot? Perhaps you can noble one.. Bring me the head of Miragul, his robe and hand me back the two blessings I gave you, and in return I shall bequeath to you this sword I carry. Good luck my friend.");
    }
}

sub EVENT_ITEM {
  if($faction == 1 && plugin::check_handin(\%itemcount, 5504 => 1)) {  #soulfire       
    quest::summonitem(18033); #inte's first blessing
    quest::exp(100000);
    quest::say("You have chosen wisely, my friend. Take this note as a token of my blessing upon you.");
    }
  elsif($faction == 1 && plugin::check_handin(\%itemcount, 5403 => 1)){
  #ghoulbane
    quest::summonitem(18034); #inte's second blessing
    quest::exp(100000);
    quest::say("You have chosen wisely, my friend. Take this note as a token of my blessing upon you.");
    }
  elsif($faction == 1 && plugin::check_handin(\%itemcount, 18033 => 1, 18034 => 1, 19073 => 1, 1254 => 1)) { #inte's first blessing, inte's second blessing, miragul's head, miragul's robe
    quest::summonitem(11050); #fiery avenger
    quest::exp(1000000);
    quest::say("Long have I awaited this moment. You have done what even I thought impossible. Take this sword, the Fiery Avenger. You have earned both it and my deepest respect.");
    quest::depop();
    }
  else {
    quest::say("What am I supposed to do with these?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::depop();
  quest::stoptimer("depop");
} 