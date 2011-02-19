sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (!defined $qglobals{uquakey}) {
    quest::say("Thank you for helping me see the truth. When you slew the construct, I was driven to the brink of insanity. By destroying my mortal self, you freed my tortured spirit. Please accept this offering. It is a fragment of a master key. Once you have the first two pieces of the High Temple key, you will be able to bypass the wards that protect Qvic. When you have located all three fragments you may find a way to gain entrance into the lair of Txevu. The Muramites have taken control of it and I fear that even now they may be defacing our most sacred temple. Please remember that while you have come far, this is but one small step in your quest to free Taelosia. There are many challenges that yet await you.");
    quest::summonitem(60252);
    quest::setglobal("uquakey",1,0,"D3");
     }
  }
}