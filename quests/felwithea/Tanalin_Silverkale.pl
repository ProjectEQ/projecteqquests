sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. $name! I am Tanalin Silverkale, provider of the finest [mithril ore] and master craftsman of [mithril chainmail]!");
}
if($text=~/what mithril ore/i){
quest::say("Mithril ore is a special variation of silver. We Koada'Dal have developed specialized techniques in working the ore to produce the finest quality armors and weapons in all of Norrath. Mithril can only be worked in our unique Koada'Dal Forge. It is worked in the same manner as standard ores but must be tempered with Morning Dew instead of Water. and Folded Mithril Sheets must be hammered with our Elven Smithy Hammers instead of the crude standard Smithy Hammer. Powerful enchanters have also successfully developed the means to enchant small bricks of mithril ore that can be worked in our Koada'Dal Forge.");
}
if($text=~/what mithril chainmail/i){
quest::say("Mithril Chainmail is a beautiful chain armor that is light enough to be worn comfortably even by those who practice the mystical arts. Mithril Chain may only be crafted in our unique Koada'Dal Forge. All pieces of the chainmail require an Elven Smithy Hammer, the appropriate Chain Pattern for the desired piece, a Silk Swatch and Moonlight Temper. Veils, Neckguards and Bracelets require one set of Mithril Rings. Coifs, Mantles, Skirts, Sleeves and Gloves require two sets of Mithril Rings. Tunics, Capes, and Leggings require three sets of Mithril Rings. If ever you master the technique of crafting mithril chain you may desire to pursue crafting some [enchanted mithril] chainmail.");
}
if($text=~/what enchanted mithril/i){
quest::say("Enchanted mithril chainmail is highly prized by the royalty of Felwithe and invaluable to all masters of the mystical arts. Like standard mithril chain it can only be crafted in our unique Koada'Dal Forge. but the rings must be crafted from enchanted mithril."); }
}
#END of FILE Zone:felwithea  ID:61027 -- Tanalin_Silverkale 

