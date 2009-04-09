sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What do you want? Do not disturb me lest you plan to assist in my [summoning of Dread].");
}
if($text=~/i want to assist you in the summoning of dread/i){
quest::say("There are some components essential to the summoning of the avatar of Dread. I require the eye of a griffon. some [powder of reanimation]. the brain of the Ishva Mal. and the toes of an ice giant. Fetch me these reagents so that we may summon the avatar to forge a shield worn only by the mightiest apostles of Cazic-Thule.");
}
if($text=~/what powder of reanimation/i){
quest::say("There is a gnome necromancer who has been experimenting with a powder used in reanimating long dead organic tissue. He is known to frequent places populated by undead in order to pursue his research. Seek him out and procure a bit of his powder."); }
}
#END of FILE Zone:paineel  ID:75071 -- Nivold_Predd 

