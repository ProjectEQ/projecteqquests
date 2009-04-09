sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings friend $name! I am a provider of the highest quality steel ore known to Norrath! This ore is in such demand that I often run low and find it difficult to restock my supplies. If you're [looking for a job] I will gladly pay you for some of your time.");
}
if($text=~/i am looking for a job/i){
quest::say("I need you to take this crate and fill it with either Small Bricks of Unrefined Ore or Large Bricks of Unrefined Ore then return it to me so that I may refine it and sell it. The unrefined ore that I require is often mined by the goblins in the ruins of Permafrost Keep."); }
}
#END of FILE Zone:qeynos  ID:1040 -- Yakem_Oreslinger 

