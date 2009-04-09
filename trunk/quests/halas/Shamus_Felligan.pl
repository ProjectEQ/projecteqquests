sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetin's! Justice speaks through us. We're the followers o' the Tribunal. We act as judge. jury and executioner fer all misled Northmen. Sometimes we must also execute our swift justice upon evil races. such as th' [ice goblins].");
}
if($text=~/what ice goblins/i){
quest::say("The ice goblins are a weak race. They pose no threat to our community. but lately we've heard rumors of ice goblins as can cast spells. They're said to be as weak as the goblin warriors. so I seek to employ the talents of our young shamans to [hunt the goblin casters].");
}
if($text=~/i will hunt the goblin casters/i){
quest::say("Aye. ye'll serve justice.  I must find the source o' their recent spellcasting ability.  I hear reports o' glowing necklaces upon these wicked beasts' necks. Get me one o' these casters' necklaces. Return them in any condition at all. Go! Justice awaits yer return."); }
}
#END of FILE Zone:halas  ID:29060 -- Shamus_Felligan 

