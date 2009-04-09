#This NPC is just some flavor text for the zone, so far as I or Allakhazam can tell. Found the text, and wanted to add it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Eh, hrm? Who're you? Found yer way in here, 'ave ya? Not the brightest idea in the world, ya know. I hope you weren't planning on going any further, because that would really be on the level of those twerps that freed that [shiny beast] in the first place.");
  }
 elsif($text=~/shiny beast/i){
  quest::say("Ya know that story about how those two dragons got together and made that premzatica dragon?");
  quest::signalwith(128037,0,0);
  }
# elsif($text=~/went crazy/i){
#  quest::say("No text currently available for this trigger phrase!");
#  }
 elsif($text=~/four/i){
  quest::say("Them thar four warders. They were the most powerful elemental dragons of their time, and kept that sleeping fella asleep for quite some long time. Names of Nanzata, Tukaarak, Hraashna, and Ventani, if'n my mind serves me correct-like. When they started here, they had some other big-time dragon create the big ice creatures all over the place -- the golems, don't ya know? In any case, they upped and got kilt by some folks like you a while back, causing all kinds of panic and havoc. The ice guys were dismantled by the [new inhabitants] of this here lair and reassembled to serve them. Not that it really matters to me, I got lost here anyway and look what happened ta me!");
  }
 elsif($text=~/new inhabitants/i){
  quest::say("Why the ancients of course! They just kinda cropped up when that big shiny fella was awakened by those other people. Some thought that those four warders were trouble, but believe me, they're like drakelings in comparison. Kal or Jobana over here might know more about them than I do, I'm just a lost little gnome with no where to go.");
  }
}

sub EVENT_SIGNAL {
 if($signal == 0) {
  quest::say("Yar, whate'er. Anyway, that bugger got made an' he went wild all over Velious, making demands and actin' all proud and powerful and things like that. Well, he decided he wanted ta have a nice big home in the middle of the mountain. And you know what? That's what he did! Yer standin' in the middle of his lair. Well after he [went crazy], some of those other dragon-folk decided it would be good ta put him in here and put him ta sleep for all eternity. [Four] of 'em kept him sleepin' and made sure that no one, such as yerself, could get in here ta wake him up.");
 }
}

sub EVENT_ITEM {
 quest::say("I have no use for that, keep it."); #Made this up
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills