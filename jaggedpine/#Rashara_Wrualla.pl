sub EVENT_SAY {
if ($client->GetGlobal("beast_epic") ==4) {
  if ($text=~/wait/i) {
    quest::say("I have no time to study now. I must leave and prepare to assist Muada. I would guess you have a role in all of this too. Goodbye, young one.");
    quest::summonitem(57008);
  }
  }
 if ($client->GetGlobal("beast_epic") ==15) {
  if ($text=~/hail/i) { 
  quest::say("Aye, I do remember that face, Beastlord. I am still recovering from my short trip to Kuua that suffers from the touch of the Realm of Discord. What a dark and foul place it is. Some of the creatures have hearts so dark it is nearly inconceivable. One of those creatures has robbed me of what I hold [" . quest::saylink("most dear") . "].");
}
}
 if ($client->GetGlobal("beast_epic") ==15) {
  if ($text=~/most dear/i) {
   quest::say("There is a beast called a girplan, and while it does draw blood, it digs its fangs much deeper. I was traveling with my warder and encountered a girplan that was different somehow. It attacked me and my faithful warder ran to my aid. I did come upon some [" . quest::saylink("luck") . "], though.");
   }
   }
if ($client->GetGlobal("beast_epic") ==15) {
  if ($text=~/luck/i) {
  quest::say("I was able to get some distance when it landed a fatal blow to my companion. But, not only did it draw its blood afterward, it drew its essence, and now I am unable to summon my companion to my aid. I do not understand how it happened and I would have thought it [" . quest::saylink("not possible") . "].");
  }
  }
if ($client->GetGlobal("beast_epic") ==15) {
 if ($text=~/not possible/i) {
    quest::say("It would mean a great deal to me and the elders if you could seek out this girplan in that eerie scarred land and, perhaps, discover what it did to my warder. I am unable to go myself as I could never dream of traveling without my warder. You will find a beastlord in Discord who also seeks the same creature. Give him this note.");
    quest::summonitem(52906);
   }
  }
}
 
 
sub EVENT_ITEM {
 if ($client->GetGlobal("beast_epic") ==3) {
  if (plugin::check_handin(\%itemcount, 57008 =>1 )) {
    quest::say("Terrible. Just terrible. I had a feeling something was wrong. You may return this to him--I have signed it. Interesting place here, isn't it? Those potameids do cause some trouble. I find them very hard to study as they are quite feisty. I specialize in the advancement and power of warders and the spirits of the wild I command are very dear and special. Many of them are of an ilk you have never seen and they are much sought after. All that will have to [" . quest::saylink("wait") . "]. I must go.");
	quest::setglobal("beast_epic", "4", 5, "F");
   }
 }
 if ($client->GetGlobal("beast_epic") ==15) {
   if (plugin::check_handin(\%itemcount, 52907 =>1, 52908 =>1 )) {
     quest::say("I am speechless. You have done what I thought was impossible. You've restored my place as a beastlord and an elder. I am forever in your debt. Return to Muada and tell him I sent you so you may hear the most-troubling news . . . it seems we know more about a true enemy of beastlords in Discord. I can say no more.");
     quest::setglobal("beast_epic", "16", 5, "F");    
   }
 }
   plugin::return_items(\%itemcount);
   $qglobals{muadalet}=undef;
}