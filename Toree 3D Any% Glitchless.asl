state("Toree3D") {
    int levelId : "UnityPlayer.dll", 0x016EFFF8, 0x68, 0x50, 0x20, 0xB8, 0xE10, 0x518, 0xA0C;           // 2 = level, 3 = menu
    int victoryCutscenePlaying : "UnityPlayer.dll", 0x0163C900, 0x0, 0x10, 0x130, 0x120, 0x50, 0xB2C;   // 2 = not playing, 3 = playing
}

start {
    if (old.levelId == 3 && current.levelId == 2) {
        return true;
    }
}

split {
    if (timer.CurrentSplitIndex <= 7) {
        if (current.levelId == 3 && old.levelId == 2) {
            return true;
        }
    } else if (timer.CurrentSplitIndex == 8) {
        return true;
    }
}