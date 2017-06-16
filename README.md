# cpu_governor

A bash program that checks or changes the active CPU governor for each core.

Place script in /usr/bin/

Usage:

**governor check<br />**
    show active governor for each cpu core and available governors<br />

**governor \<selected governor\><br />**
change to selected governor for all cpus<br />

**governor \<cpuid\> \<selected governor\><br />**
    change to selected governor for chosen cpu id<br />
    e.g: 'governor 0 powersave' - will change the cpu0 governor to powersave<br />
