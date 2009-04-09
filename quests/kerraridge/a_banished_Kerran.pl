sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Rrrrrr..  Away frrrom this isle of death and.. prrrr.. punishment."); }
if($text=~/What remains of Thipt/i){
quest::say("Clawknight Thipt wished to learn the ways of Ashen. Prrr. Together we go into green Goblin's lair to train. Prrr.. We find too many and he is too weak. Seperated and unable to find him, I hear his death cry. Prr.. I cannot make it back, the eyes are upon me. Now I must find one sent by Ashen to aid in the recoverrry of his remains - his Humorous Handled Mace, Ribcage Breastplate, Cat Skullcap and Fractured Femur Bone"); }
}
sub EVENT_ITEM { 
if ($item1=="12369"){
quest::say("Ashen Order!! Prrr.. My order. I have been expecting one of us. Prrr.. Help me rejoin my native land. Return the [remains of Thipt] to me. This shall aid me in my redemption."); }
if ($itemcount{12375} == 1 && $itemcount{12374} == 1 && $itemcount{12372} == 1 && $itemcount{12373} == 1){
quest::say("Prrr.. Thank you brother of Ashen. I can now spend my time upon this island in peace, until my penance is serrrved. He dabs his paw into the mud and places it upon a tattered parchment. Take this message to Puab. Farrrwell.");
quest::summonitem("28055");
quest::exp("100"); }
}
#END of FILE Zone:kerraridge  ID:74029 -- a_banished_Kerran 

