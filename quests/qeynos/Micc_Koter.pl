sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Oh, hello, $name.  Don't mind my associate Klieb over there.  He gets quite grumpy when he drinks.  We are relatively new here ourselves but have made some fast friends in Qeynos.  This is a city of opportunity.");
}
if ($text=~/paw of opolla/i) {
  quest::say("Some guy, don't know who he was, was in here claiming he had a lead where to find some information on the Paw of Opolla. I don't know anything about it except it is supposed to be the paw of some old gnoll bitch and have some magic powers. Buy me a Brandy and I might tell you where he was going.");
}
if ($text=~/ranger/i) {
  quest::say("Beats me. Try going to the north near Surefall Glade. That is where those goodie goodies tend to hang out.");
}
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13034 =>1 )) {
    quest::say("Oh yes. Now I remember.. Ha ha.. He said he was going into the Plains of Karana to look for some gnoll lover by the name of Caninel. He said Caninel knew something about the location of the Paw of Opolla. It sounds like a bunch of rat crap to me , I never heard of no one named Caninel. But off he went.. Heck , finding one person in the Plains of Karana without a [ ranger ] to guide you is like looking for a clean spot on ol'Klieb here. Ha ha!!");
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1081 -- Micc_Koter 

