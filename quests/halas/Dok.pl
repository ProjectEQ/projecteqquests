sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Fine day to ye, $name.  Welcome to me shop.  If ye're searchin' fer a [cigar], ye won't be findin' any, more's th' pity.");
}
if($text=~/what cigar/i){
quest::say("I was hoping to perfect me creation I was callin' the 'cigar.' but I'm afraid I just couldn't get it right.  To keep from settin' meself on fire, I switched me talents to makin' candles.  I could use help from a person such as yerself.  Ye could [collect the wax] fer me - the candle-makin's.");
}

if($text=~/collect the wax/i){
quest::say("Grreatt!!  Take this wax jarr.  Head to any place ye can find the wee ones they call bixies. I'm afraid ye're going to hafta bash 'em and search to find out if they're carrying any honeycombs.  If they are, then ye can fill the jar with them and combine them, then return the full honeycomb jar to me. I'll be givin' ye a special candle if ye can do that fer me.");
quest::summonitem(17958);
}
if($text=~/murderer/i){
quest::say("Aye. I've heard some things about the murderer. I investigated the crime but I could nah find a thing to help solve it. Ye might be able to get some more information from the leader of Clan McMannus. They are a clan that lives on the outskirts of Qeynos Hills in the Western portion of the Karana plains. They are a fishing clan, so they will be near the ocean. Ask their leader about the [murderer].");
}
if($text=~/sweaty clothing/i){
quest::say("Ah yes. I had forgotten about the sweaty shirt. I did not think it was useful so I sold it to [Tundra Jack].");
}
if($text=~/tundra jack/i){
quest::say("Tundra Jack is a man who wanders the Everfrost plains with his large polar bear named Iceberg. He has dedicated himself to ridding the land of Ice Giants."); }
}

sub EVENT_ITEM
{
if (plugin::check_handin(\%itemcount, 12222 =>1 )) {
     quest::say("Great work!! Now I can make more candles! Here ye are, me friend. I call this the Everburn Candle. It has a wee bit o' magic in it. I hope ye like it.");
   quest::summonitem(12220);
   quest::givecash(0,0,0,1);
   quest::exp(250);
   quest::ding();
   quest::faction( 213,3);
   quest::faction( 361,3);
   quest::faction( 294,3);
 }
}

#END of FILE Zone:halas  ID:29030 -- Dok 

