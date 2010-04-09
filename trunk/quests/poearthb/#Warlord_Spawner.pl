sub EVENT_SIGNAL {
    if (defined $qglobals{poeb_Galronar} && defined $qglobals{poeb_Awisano} && defined $qglobals{poeb_Birak}) {
        quest::spawn2(222019,0,0,$x,$y,$z,$h);
   }
}