#gnome wizard dude 
#npc - Ghilanbiddle Nylwadil
#zone - Dagnors Cauldron
#by Angelox

sub EVENT_SAY {
my $random_result = int(rand(100));
if(($text=~/Hail/i)&&($random_result<=50)) {
    quest::say("You're welcome to leave this camp at once!!  We are not here to keep you warm and safe from harm!!");
    quest::signal(70006,5);
}else{
   quest::say("What business do you have here?!!  Trying to keep safe?  Expecting us to fight your battles?  Bah!!");
  }
}

sub EVENT_SIGNAL {
quest::say("Ha!!  One like that one stands no chance within this realm. The goblins shall skin him alive!!");
quest::signal(70005,5);
}
