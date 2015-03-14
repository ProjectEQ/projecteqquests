#BeginFile poknowledge\#Geboron.pl
#Quest for Plane of Knowledge - Geboron: Necromancer Epic 1.5 (Pre)

sub EVENT_SAY {
  if(($text=~/hail/i) && $class eq "Necromancer" && !defined($qglobals{NecroPre}) && !defined($qglobals{SoulWhisper})) {
    quest::say("'Yes. . . $name is it? I have heard of you. I am Geboron, assistant to Kazen. It is most fortunate for you that you happened upon me. I have a task that is of the utmost importance and I believe I can trust you with it. There has been talk recently among my brethren of a most powerful staff that was recently discovered in the realm of discord and is now in the hands of a group of paladins. However my undead servants have informed me that the paladins were transporting the staff through the Karanas and suddenly disappeared without a trace. I want you to find my contact, Yuanda in West Karana and give her this note. It says you are working for me now. Find out what happened to those paladins and the staff! If you find out anything, talk to my assistant, Egonis in Lake Rathe.");
    quest::summonitem(15809); #Note to Yuanda
  }
  else {
    quest::say("Begone, peasant!"); #Still need real text
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20612 => 1)) { #Piece of the Staff
    if(defined($qglobals{NecroPre}) && ($qglobals{NecroPre} == 1)) {
      quest::say("I ask you to find a staff of great power and you bring me this??! A piece of the staff? You are an incompetent fool! Take this trash back and give it to Kazen so that he may punish you as he sees fit! Begone!");
      quest::summonitem(20612); #Piece of the Staff
      quest::setglobal("NecroPre",2,5,"F");
    }
    else {
      quest::say("What is this trash you give me?"); #Text made up
      #quest::summonitem(20612); #Piece of the Staff (Eat the staff. Somehow this player was cheating. Uncomment to allow player to have staff back.)
    }
  }
  plugin::return_items(\%itemcount);
}
#EndFile poknowledge\#Geboron.pl (202273)