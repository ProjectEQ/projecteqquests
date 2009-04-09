sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Ah. greetings. I hope you are a student of the way of fear. Within this temple there are many who can teach you to harness your gifts. I am an instructor in the [rituals of fear].");
}
if($text=~/what rituals of fear/i){
quest::say("So you wish to learn. eh? I am working on a ritual to strike fear into the hearts of the other inhabitants of Odus. The reagents I require for this ritual are the doll of a Kerran priestess. the ichor of a giant wooly spider. your initiate symbol of Cazic- Thule. and a giant snake fang with which to carve my glyphs. Fetch me these components. We shall infect this land with fear. and I shall reward you with the station of disciple of this temple."); }
}
#END of FILE Zone:paineel  ID:75019 -- Atdehim_Sqonci 

