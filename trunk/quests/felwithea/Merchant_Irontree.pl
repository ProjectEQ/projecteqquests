sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. $name! I am a master craftsman of both steel and [mithril plate] armors. I am also the creator of the [woodlanders shields]. light shields perfect for those who spend much time under the canopy of the All Mothers forests.");
}
if($text=~/what mithril plate/i){
quest::say("Mithril plate armor is an enduring light weight armor that can only be crafted in our unique Koada'Dal Forge. It is perfect for those who wish to battle the enemies of the All Mother in protection and comfort. It is the most silent of all plate armors. a definite advantage for gaining the upper hand on those who would dare invade our forests. All pieces of mithril plate will require the appropriate Plate section Mold, some Moonlight Temper, an Elven Smithy Hammer, Mithril Chain Jointing and Leather Padding. Visors, Collars, Bracers and Boots require one Folded Sheet of Mithril. Helms, Pauldrons, Girdles, Vambraces and Gauntlets require two Folded Sheets of Mithril. Breastplates, Cloaks and Greaves require three Folded Sheets of Mithril.");
}
if($text=~/what woodlanders shields/i){
quest::say("Woodlanders shields can only be crafted in our unique Koada'Dal Forge. In order to successfully craft such a shield you will require a Kite Shield Mold, two Sheets of Mithril, an Elven Smithy Hammer and some Moonlight Temper. If you are a faithful subject of the All Mother than you may attempt to craft a magical woodlanders shield by forging an emerald that has been imbued by a cleric into the shield at the time of its creation."); }
}
#END of FILE Zone:felwithea  ID:61057 -- Merchant_Irontree 

