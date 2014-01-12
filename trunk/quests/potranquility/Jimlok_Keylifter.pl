sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. traveler.  Can I be of assistance to you?  Can't say as I got much to do at the moment.  I'm just attending to a little fishing while I wait on my [" . quest::saylink("friend") . "] to get back to me.  Hopefully he doesn't keep me waiting for too much longer.  I can only stand so much of this place.");
}
if($text=~/friend/i){
quest::say("This is the situation.  My friend Gilor Swiftfoot and I were going to try our hand at breaking into the Plane of Justice. Yeah. yeah. I'm sure you're thinking that's silly and all. but how many people do you know of that can say they've broken out of the Eternal Prison. let alone in? 'None', right? So, we were all ready to go in when I got word that something else needed re-appropriating all quick like. I told Gilor to wait until I got back, but no. He had to run off, eager as always and as patient as a gust of wind. Now, I think he's in [" . quest::saylink("trouble") . "].");
}
if ($text=~/trouble/i) {
quest::say("People here seem to think that he tried to make the prison break by himself. They've found another way in, so maybe he took that route. I'd like to check on him, but if he isn't in there, I'm liable to get myself in trouble. I think I'd be much better off staying here and waiting for him. If you want to go look for him, I'd be quite grateful. I doubt you have the skills to get far in there. You don't look like the burglarizing type, but I'd even be willing to give you the [" . quest::saylink("document") . "] that I picked up on my last job if you look for him.");
}
if ($text=~/document/i) {
quest::say("Don't you worry about that unless you bring me some word of Gilor's condition. Trust me, it's a strange and mysterious document. Just the sort of thing you adventuring types love. Find Gilor and it's all yours, I give you my word.");  
}   
if ($text=~/i will look for him/i) {
quest::say("Alright, friend, you need to be on the lookout for a gnome about my height, with one bad leg. He's got a bit of a limp, but he's still a hard one to chase down. If you can't find him, be on the lookout for anything that resembles a small bottle. He's got a way with rodents; so if you see some little pest carrying a bottle of some sort, grab him! It will most likely be a message for me. Bring it back immediately. It won't be of any use to you anyway, since you can't read our code. Be quick and good luck!");
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 28277 => 1)) {
  quest::summonitem(28278);
  quest::emote("sighs deeply as he hands you an intricate schematic of some device. The notation on the document is written in a strange language that is completely foreign to you. 'This doesn't bode well for Gilor. He says he's found a secret tunnel and he's going to go in deeper. I guess I'll go in and find him if he doesn't return soon. Well, a deal is a deal. Here is the document that I mentioned.");
  quest::say("The person that I was supposed to lift it for was a jeweler of sorts, but he mainly dealt in mechanical devices. I wasn't able to track him down to get my coin, so I don't know what you'll do with it. Maybe my cousin Tabben will give you something for it. He's got himself a little tinker's shop in the Jeral section of New Tanaan. Show him the map thingy and see what he says.");
}  
 
}
#next part to tabben bromal in knowledge
#END of FILE Zone:potranquility  ID:203021 -- Jimlok_Keylifter 

