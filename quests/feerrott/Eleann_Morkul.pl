sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome friend. you're a great leap from any sort of civilization.  What brings you to this foul place? Are you an adventurer or just a connoisseur of wretched foliage and damp clothing?");
}
if($text=~/i am an adventurer/i){
quest::say("Well. I gathered as much. but I try to avoid assumptions.  Are you by chance heading to the temple?  It seems to be quite a draw for adventurers and academics alike.  Though we've yet to witness either group leave the structure once they've entered it.");
}
if($text=~/i am heading to the temple/i){
quest::say("Well. take care and prepare for the most horrific of possibilities. my friend.  Our trip has been terrifying enough and we've yet to enter the temple itself.  I've seen enough from here to confirm some of the rumors that we were sent to investigate.");
}
if($text=~/what rumors/i){
quest::say("The Academy sent my colleagues and I to investigate several reports about Tae Ew tribal activity that have found their way to Freeport during the course of the last lunar cycle.  The rumors stated that the primitive creatures have made several great discoveries of a necromantic nature in an incredibly short time.  I was assigned to gather any artifacts and information that I could uncover.  If you should learn more about their magic. please return to me before we leave and you will be rewarded.");
}
if($text=~/what magic/i){
quest::say("The Tae Ew have never been brilliant. but their capability for magic use has always existed.  It was shocking to learn that they have been reported to have opened portals to Planes of existence outside of our own.  The Tae Ew have also begun to display a metamorphic progression as well.  Given the rate at which these changes have occurred. we can only assume that they are being directed by a will greater than their own.");
}
if($text=~/i am a connoisseur/i){
quest::say("Well. enjoy yourself.  I know that I've had quite enough of it myself.");
}
if($text=~/what temple/i){
quest::say("The temple of the lizardmen.  The lost temple of Cazic-thule. It's just to the east of here... across the river."); }
}
#END of FILE Zone:feerrott  ID:47131 -- Eleann_Morkul 

