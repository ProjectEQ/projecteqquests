sub EVENT_DEATH {
    quest::setglobal("poeb_Galronor",1,3,"D3");
    quest::signal(222023);
}