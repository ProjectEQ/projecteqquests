sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Me says hi to you.  What you want from me?  Oh!!  Me shaman trainer.  You must be shaman.  Are you [shaman Darkone]?");
}
if($text=~/i am a shaman darkone/i){
quest::say("You choose rite if you bes a shaman.  Wes da best.  You remember ta not get in Kaglari way.  He get mad berry easy.  He gets berry mad at Urako if he finds out me make [big mistake].");
}
if($text=~/what big mistake/i){
quest::say("Kaglari makes Urako cleans his kwarters.  He says nots to open closet.  Me make mistake and opens his closet and out comes da skeletons.  Dey runs out into Grobb.  Me needs ta gets dem back before Kaglari finds out.  Me needs sumwun to [collect Kaglari skeletons].");
}
if($text=~/i want to collect kaglari skeletons/i){
quest::say("Tank you!!  Dere is fours of dem.  You can finds dem here in Grobb.  I no tink dey will want to come homes to Kaglari's closet.  You ask dem to [come back to the closet] and see whut dey say.  If you gets dem back me promise to gives you a [Kaglari mana doll].");
}
if($text=~/what kaglari mana doll/i){
quest::say("Kaglari catch many humans.  He pull spirit from dem and force into dolls.  Now deir spirit give shaman extra mana.  Dey good power source.  Now humans good for someting.  Da mana dolls only for shaman power."); }
}
#END of FILE Zone:grobb  ID:5222 -- Urako 

