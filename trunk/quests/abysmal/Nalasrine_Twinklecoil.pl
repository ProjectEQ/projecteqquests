# Vendor text for Muramite armor
# created by Gonner

sub EVENT_SAY{
  if ($text=~/hail/i) {
    quest::say("Salutations! It is great to see so many eager travelers out and about. How are you enjoying our little city here? I have been quite busy myself. There are so many interesting things to learn about these strange beings that inhabit Taelosia. Their armor in particular is most interesting. I have developed some intriguing compounds. Let me know if you are interested in such things before I just prattle on!"); 
  }
  if ($text=~/interested/i) {
    quest::say("Oh, good. Well let me see. Basically, I have been studying the armor that our explorers have been bringing back from their adventures. While it is a bit strangely shaped, as these creatures that seem to reside here are, I have found that by strengthening some native materials it can be reworked into rather fine armor for the likes of you and me."); 
  }
  if ($text=~/armor/i) {
    quest::say("If you are looking into having some armor made, you definitely will need to use my infusions. They are a bit pricey, however they are difficult to make and well frankly, I am the only one who can! Use the plate solvent on plate armor, chain solvent on chain, tanning solution on leather, and silk strengthener on silk. All rather intuitive isn't it? Simply take a look at the different types I have for sale."); 
  }
}
#END of FILE zone:abysmal ID:279011 -- Nalasrine_Twinklecoil.pl