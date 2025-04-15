#Requires AutoHotkey v2.0

global nextSwitchTime := RandomTimer()
SetTimer(CycleWindows, nextSwitchTime)

; Keep track of last window index
global lastIndex := 0

cycleWindows() {
    global nextSwitchTime, lastIndex

    winList := WinGetList()
    winCount := winList.Length

    if winCount = 0 {
        nextTime := RandomTimer()
        SetTimer(CycleWindows, nextTime)
        return
    }

    ; Choose next window
    if winCount > 1 {
        index := Random(1, winCount)
        while index = lastIndex {
            index := Random(1, winCount)
        }
    } else {
        index := 1
    }

    try {
        WinActivate(winList[index])
        lastIndex := index
    } catch{
        Send("{Alt down}{Esc}{Alt up}")
        Send("{Alt down}{Esc}{Alt up}")
    }

    try {
        activeWin := WinGetID("A")
        processName := WinGetProcessName(activeWin)
    } catch {
        nextTime := RandomTimer()
        SetTimer(CycleWindows, nextTime)
        return
    } 

    ; Define key sequences for specific programs
    switch processName {
        case "firefox.exe":
            Sleep(1000)
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(1000)
            RandomlyScrollMouse()
        case "Code.exe":
            Sleep(1000)
            Send("{Ctrl down}{Tab}{Tab}{Ctrl up}")
            Sleep(1000)
            RandomlyScrollMouse()
        case "MobaXterm.exe":
            Sleep(1000)
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(1000)
            RandomlyScrollMouse()
        case "WindowsTerminal.exe":
            Sleep(1000)
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(1000)
            RandomlyScrollMouse()
        case "webstorm64.exe":
            Sleep(1000)
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(1000)
            RandomlyScrollMouse()
        case "phpstorm64.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(1000)
            RandomlyScrollMouse()
        case "datagrip64.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(1000)
            RandomlyScrollMouse()
        case "explorer.exe":
            Sleep(1000)
            Send("{Ctrl down}{Tab}{Ctrl up}")
        case "Fork.exe":
            Sleep(1000)
            Send("{Ctrl down}{Tab}{Ctrl up}")
        case "slack.exe":
            RandomlyScrollMouse()
    }

    Sleep(1000)

    ; Schedule next cycle
    nextSwitchTime := RandomTimer()
    SetTimer(CycleWindows, nextSwitchTime)
}

RandomTimer()
{
    ; Generate a random number between 240000 and 360000 milliseconds (4 to 6 minutes)
    return Random(3000, 5000)
}

RandomlyScrollMouse() {
    scrollAmount := Random(10, 30)
    direction := Random(1, 2)

    if direction = 1 {
        Send("{WheelUp " scrollAmount "}")
    } else {
        Send("{WheelDown " scrollAmount "}")
    }

    Sleep(Random(500, 1000))
}