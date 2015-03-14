sub EVENT_SAY {
 if (defined $qglobals{shaman_pre} && $qglobals{shaman_pre} == 1) {
  if ($text=~/hail/i) {
    quest::say("Ah so the Elder Spirit of Enlightenment has sent you to me. I do have a task for you if you wish to help the cause of the spirits across the lands. I have been charged with making an elixer that will aid the spirits for a time. Are you [interested] in aiding us?");
  }
}
if (defined $qglobals{shaman_pre} && $qglobals{shaman_pre} == 1) {
if ($text=~/interested/i) {
  quest::say("Very well then. First you must do what you can to prove yourself to our kind. There are some tests you must perform in order to gain our trust. At the end of this path, we may consider you one of the Heyokah -- the most trusted of those align themselves with shaman everywhere. You will be required to take on the tests of Patience, Wisdom, and Might. Bring me the Black fur Boots you receive to me.");
}
}
if (defined $qglobals{shaman_pre} && $qglobals{shaman_pre} == 2) {
if ($text=~/ingredients/i) {
  quest::say("I will need some unique blood from a crystal-like spider from a valorous plane, a special leaf that an insect of the diseased hordes eats whole and antennae from a skittering bug in Taelosia. I will also need you to make your way into the deserts of Ro and find a lonely merchant who sells a unique vial I require. Return all of these to me and you will find yourself able to walk a greater path.");
}
}
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1678 =>1 )) {
    quest::say("You can now be called a heyokah, but there is much you may still do. I do require several [ingredients] for the potion I am required to make and should you assist me, there is a spirit with even greater tasks that will give you audience.");
    quest::setglobal("shaman_pre",2,5,"F");
  }
  if (plugin::check_handin(\%itemcount, 57988 =>1, 57991 =>1, 57990 =>1, 57989 =>1 )) {
   quest::say("You have served us well and now I may get to work. You are indeed ready and should seek out the Elder Spirit of Enlightenment as soon as you are able. Should he deem you worthy and wise enough, he will have much work for you to do to preserve the way of the shaman."); 
   quest::setglobal("shaman_pre",3,5,"F");
  }
  plugin::return_items(\%itemcount);
  $qglobals{shaman_pre}=undef;
}