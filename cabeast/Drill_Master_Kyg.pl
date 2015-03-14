sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome. Welcome!!  Time to train.  Time to fight.  Time to serve the Iksar Empire.  You will need weapons.  I have the [footman pike] for all new recruits to earn.");
}
if($text=~/what footman pike?/i){
quest::say("A footman pike is what you need.  A footman pike is what you get. but earn it you will.  You must [slay many beasts] to prove to us that you are a true warrior.  Fail and you will be exiled to live with the Forsaken.");
}
if($text=~/I will slay many beasts/i){
quest::say("Yes.  You will slay or you will be slain.  Take this footman's pack and fill it you will.  Fill it with [weapons of our foes].  When all are combined. the full footman's pack shall be returned to me along with your militia pike.  Do this and earn your footman pike and then we may have a true mission for you.");
   quest::summonitem(17027);
}
if($text=~/what weapons of our foes?/i){
quest::say("Yes.  You need to know the weapons required.  Fill the pack with javelins.  Froglok bounder and goblin hunter javelins.  Two of each.");
 }
 if ($text=~/footman moglok/i) {
   quest::say("My dear friend, Warlord Hikyg of the Swamp Gate has encountered some difficulty with a Trooper Moglok. He requested that I find a brave soldier to take charge of the situation. Are you willing to [assist Warlord Hikyg]?");
 }
 if ($text=~/assist Warlord Kikyg/i) {
   quest::say("Good. Take this note to Footman Moglok of the swamp garrison. He shall instruct you on your mission.");
   quest::summonitem(18234);
 }
}


sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 12430 =>1, 5131 =>1 )) {
     quest::say("Kyg knew you could do it. You will make a fine legionnaire some day but, for now, you shall be a footman. Take the footman pike head plans. Forge the footman's pike. Do so, and then you may have an audience with the War Baron on the subject of his [Memory of Sebilis].");
     quest::summonitem(12475);
     quest::exp(500);
   quest::faction( 30,2);
   quest::faction( 193,2);
   quest::faction( 282,2);
   quest::faction( 317,2);
   quest::faction( 62,2);
   }

 #do all other handins first, then let it do disciplines
 plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
 plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabeast  ID:1113 -- Drill_Master_Kyg 

