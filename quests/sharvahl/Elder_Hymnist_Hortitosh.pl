## Changes by Kagehi.
## $Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
## Since we don't want to hand people things that they can't normally get, or
## stuff they haven't earned, we need to track which stage in the quest they
## are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
## 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
## and 7 = Initiate's Cloak.

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. are you here to assist with something specific or just looking for something to do.");}
##Non-canon, for fixmes if you lose certain items (which are needed for this quest line and others).
##No idea if Live does this now or not. If these do exist there, feel free to adjust it.
if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
  quest::say("Luckily for you someone found it.");
  quest::summonitem(2873);}
if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
  quest::say("Someone found this under a table at the one of the pubs. Try not to lose it this time.");
  quest::summonitem(2878);}
  if ($text=~/essence of sonnet/i) {
  quest::emote("stops what he is doing and looks at you, most surprised");
    quest::say("An essence of sonnet? I have never produced such a thing my friend, though the fact that you would even request one from me is very flattering.' His eyes leave your face and settle off in the distance somewhere as he continues, 'I was present once when one was created... it was beautiful. I was only a child, but there was no mistaking the significance. Oh how I would love to produce such a thing myself- an accomplishment without peer for one of my art. They say that the inspiration must be genuine, should you know of something that could inspire me so then by all means, I will see if I have an essence of sonnet within me.");
  }
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18324 =>1 )) {
  quest::say("Thanks, $name!  That is a wonderful story of inspiration.");
  quest::summonitem(5991);
}
if(plugin::check_handin(\%itemcount,18552 => 1)){
quest::say("Our newest instrumentalist arrives! You have grown strong in the safety of our city and it is time now for you to repay our society. The Jharin. keepers of our history. accept you and deem you to be worthy of our training. Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
quest::say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
## We don't care at this point who gives you the application, cloak, etc.
## Only later, when we get into class specific quests will the person you
## come to, in order to recover lost items, matter.
## Using "all npc, this player, and all zones", since some later stuff in
## the class quest lines, linked to the cloak, are in other zones, should we
## use this to track cloak progress as well.
quest::setglobal("Shar_Vahl_Cit",1,5,"F");
quest::summonitem("2873");
}
elsif (plugin::check_handin(\%itemcount, 2897 => 1)) {
quest::say("This item. by itself. means nothing to me.");
quest::say("$name. citizen of Shar Vahl. accept this cloak as a symbol of your loyalty and service to our noble people. It will grow with you. young initiate. and like you it has incredible potential. Present your slate of citizenship to Gherik and he will guide you through your early training. May your songs inspire us all!");
quest::setglobal("Shar_Vahl_Cit",7,5,"F");
quest::summonitem("2878");
} 
if(plugin::check_handin(\%itemcount, 3920=>1)){
quest::say("These are finely crafted indeed, $name. Merchant Fahaar told me you were quite the prodigy,
 but don't tell him I told you that. Take this receipt and show it to Fahaar and tell him the king is quite
 pleased with both your work, and his teaching!");
quest::exp(1000);
quest::ding();
quest::summonitem(3921);
} else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
}

plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155166 -- Elder_Hymnist_Hortitosh 
