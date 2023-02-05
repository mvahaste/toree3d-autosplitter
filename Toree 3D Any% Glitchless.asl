state("Toree3D") {
    int levelId : "UnityPlayer.dll", 0x016EFFF8, 0x68, 0x50, 0x20, 0xB8, 0xE10, 0x518, 0xA0C;           // 2 = level, 3 = menu
    int victoryCutscenePlaying : "UnityPlayer.dll", 0x0163C900, 0x0, 0x10, 0x130, 0x120, 0x50, 0xB2C;   // 2 = not playing, 3 = playing
}

init {
    vars.running = false;
    vars.levelNum = 1;
}

start {
    if (old.levelId == 3 && current.levelId == 2) {
        return true;
    }
}

split {
    if (vars.levelNum <= 8) {
        if (current.levelId == 3 && old.levelId == 2) {
            vars.levelNum++;
            return true;
        }
    } else if (vars.levelNum == 9 && current.victoryCutscenePlaying == 3) {
        vars.running = false;
        return true;
    }
}