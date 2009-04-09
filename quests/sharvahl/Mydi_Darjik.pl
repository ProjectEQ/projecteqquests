#Edited by anubisrwml - Shar Vahl

sub EVENT_SAY { 

if ($text=~/Hail/i){
quest::say("Greetings. did you need assistance with something or are you just browsing?"); }

if ($text=~/treat/i){
quest::say("Yes, I suspose I can treat your shield, but you will need to hand it to me first so I can measure out the cloth needed. Please, let me see it."); }

if ($text=~/soaking solution/i){
quest::say("It's really not as difficult as it sounds. The spores required to make the solution that you'll need are easy to find. They grow in the dulfis mushrooms that are found in the caves beyond the thicket. You'll just need to throw the whole mushroom into a flask of water to brew. Once the dulfis has boiled in the water for a while, you'll get a murky gray liquid. Boil the cloth in that liquid for a bit in the brew barrel and then wrap the steaming cloth around the buckler and the tincture that Fharra gave you. Let the cloth cool and you should see the desired results. Bring the buckler to me once you're done and I'll tell you if you did it correctly."); }
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 3495 => 1)) {
quest::emote("cuts the cloth big enough to cover your buckler twice over and folds it neatly. She puts the cloth on the buckler and hands it to you. She looks around for a moment...");
quest::say("Sometimes I feel as if the spirits are playing tricks on me. I'm out of spores. I never seem to run out of spores until the times when I need them most. You'll need to gather them on your own to make the [soaking solution].");
quest::summonitem(5538);
quest::summonitem(3495); }

if (plugin::check_handin(\%itemcount, 5543 => 1)) {
quest::say("Quite impressive! Quite impressive, indeed! To be honest it took me a very long time to become that good at imbuing items and enhancing their natural properties. You show a great deal of promise. If you will be willing to help me with another task, I could recommend you for a possible promotion within the ranks of the Dar Khura. I need you to take this bag and fill it with wet fang eyes. Just find a stagnant body of water, spear a wet fang, and pop its eyes out!");
quest::summonitem(5543);
quest::summonitem(17076); }

if (plugin::check_handin(\%itemcount, 5541 => 1)) {
quest::say("Thank you very much! I was almost out of these eyes and I'm sure you'll agree they aren't easy to come by. Your assistance will not go unnoticed. Here is the blessing I promised you. Take this token to Spiritualist Fehril along with your recruits cloak, and your wonderful new buckler. He'll know that I send you with my blessing. Take care and may the spirits guide you, young Dar Khura.");
quest::summonitem(5542);
quest::faction(68,10);
quest::exp(3500); }

plugin::return_items(\%itemcount);
}
#End of FILE Zone:sharvahl  ID:155068 -- Mydi_Darjik 

