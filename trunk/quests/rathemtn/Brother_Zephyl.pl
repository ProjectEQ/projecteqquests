sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. I am one with the [Lost Circle]. You have found me. What is it you desire?");
}
if($text=~/what lost circle/i){
quest::say("The [monks of the Whistling Fist] are called the Lost Circle by others. We are an ancient league of monks. Long forgotten and few yet remain. Within this realm there are only two, [Brother Qwinn] and I. We seek the items stolen from us. I seek the [idol of Zan Fi].");
}
if($text=~/I am an interested monk/i){
quest::say("Then venture to the lands of evil. The swamps of the trolls and ogres. There, seek out a monk called Raster. He has the idol. You will return here and wait for my reappearance. When we meet again, you shall hand me the idol and a red sash earned from the Ashen Order. Do so and you shall be closer to joining the brotherhood.");
}
if($text=~/what idol of zan fi/i){
quest::say("The idol of Zan Fi is a totem that is sacred to our brotherhood. I cannot share its secrets, but I can offer to you a reward for its return. Are you an [interested monk]?");
}
if($text=~/brother qwinn/i){
quest::say("Brother Qwinn is searching for one who can return the [Code of the Whistling Fist]. I believe he is in the vicinity of the Plains of Karana.");
}
if($text=~/what code of the whistling fists/i){
quest::say("The tome called the Code of the Whistling Fist has been stolen from [Brother Qwinn]. It contains many secrets pertaining to our brotherhood. Thankfully, it is magically locked and only a Zan Fi master could unlock it. Still, Qwinn must see its safe return.");
}
if($text=~/return the sash/i){
quest::say("Very well. Give to me that which you have been rewarded or the robe, if you have a tailored one."); }
}
sub EVENT_ITEM { 
if ($itemcount{12317} == 1 && $itemcount{10133} == 1 ){
quest::say("We had an agreement. The proof of a skilled monk, the red sash, and the idol of Zan Fi.");
quest::say("We thank you for the return of the idol of Zan Fi. Take this rare robe pattern. You shall find it useful should you aid [Brother Qwinn] in his quest. His item, the rare robe pattern, a swatch of shadow silk and a scroll containing Jonathan's Whistling Warsong. Into a sewing kit they will be going. And into the brotherhood will you. I hope you do not wish me to [return the sash].");
quest::summonitem("12315");	
quest::exp("200");
}
if ($itemcount{12315} == 1 ){
quest::summonitem("10133");	
}
if ($itemcount{12256} == 1 ){
quest::summonitem("10133");	}
}
#END of FILE Zone:rathemtn  ID:50021 -- Brother_Zephyl 

