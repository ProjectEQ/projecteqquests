sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome you. $name.  You look all skin 'n bones.  Eat you must do.  Chef Dooga can fix up goodies for you.  Try [HEHE meat].");
}
if($text=~/what HEHE meat/i){
quest::say("It is a secret ground meat made with high elf. human and Erudite Flesh.  Mmmm.  It good stuff.  Dooga make it and [the Gobbler] make it.  If you find any of those meats in the swamps bring to me and I pay you.");
}
if($text=~/what the gobbler/i){
quest::say("You no hear of the Gobbler!!  Him great butcher.  Have all kinds of meat.  Him am low on froglok legs. Dooga supply him.  Dooga need someone to [deliver froglok legs].");
}
if($text=~/who is the gobbler/i){
quest::say("You no hear of the Gobbler!!  Him great butcher.  Have all kinds of meat.  Him am low on froglok legs. Dooga supply him.  Dooga need someone to [deliver froglok legs].");
}
if($text=~/i deliver froglok legs/i){
quest::say("You think so!!  That be good thing.  Make the Gobbler happy.  Maybe he give you something good.  Maybe not.  You take this.  Deliver meat.");
quest::summonitem("13384");
}
if($text=~/i want to deliver froglok legs/i){
quest::say("You think so!!  That be good thing.  Make the Gobbler happy.  Maybe he give you something good.  Maybe not.  You take this.  Deliver meat.");
quest::summonitem("13384"); }
}
#END of FILE Zone:oggok  ID:49061 -- Chef_Dooga 

