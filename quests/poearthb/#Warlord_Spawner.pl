sub EVENT_SIGNAL {
    if (defined $qglobals{poeb_Galronor} && defined $qglobals{poeb_Awisano} && defined $qglobals{poeb_Birak}) {
        quest::spawn2(222019,0,0,$x,$y,$z,$h);
   }
}