#Requires AutoHotkey v2.0

global nextSwitchTime := A_TickCount + RandomTimer()
SetTimer(CycleWindows, nextSwitchTime - A_TickCount)

; Keep track of last window index
global lastIndex := 0

cycleWindows() {
    global nextSwitchTime, lastIndex

    winList := WinGetList()
    winCount := winList.Length

    if winCount = 0
        return

    activeWin := WinGetID("A")
    processName := WinGetProcessName(activeWin)

    ; Define key sequences for specific programs
    switch processName {
        case "firefox.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(500)  ;
            RandomlyScrollMouse()
        case "Code.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(500)  ;
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(500)  ;
            RandomlyScrollMouse()
        case "MobaXterm.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(500)  ;
            RandomlyScrollMouse()
        case "WindowsTerminal.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(500)  ;
            RandomlyScrollMouse()
        case "webstorm64.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(500)  ;
            RandomlyScrollMouse()
        case "datagrip64.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
            Sleep(500)  ;
            RandomlyScrollMouse()
        case "explorer.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
        case "Fork.exe":
            Send("{Ctrl down}{Tab}{Ctrl up}")
        case "slack.exe":
            RandomlyScrollMouse()
    }

    Sleep(1000) ; Small delay before switching

    ; Choose next window avoiding lastIndex
    if winList.Length > 1 {
        index := Random(1, winList.Length)
        while index = lastIndex {
            index := Random(1, winList.Length)
        }
    } else {
        index := 1
    }

    ; Activate the selected window
    WinActivate(winList[index])
    lastIndex := index

    ; Schedule next cycle
    nextTime := RandomTimer()
    nextSwitchTime := A_TickCount + nextTime
    SetTimer(CycleWindows, nextTime)
}


; Function to generate a random timer between 6 to 10 minutes
RandomTimer()
{
    ; Generate a random number between 240000 and 360000 milliseconds (4 to 6 minutes)
    ;return Random(18000, 30000)
    return Random(3000, 5000)
}

; Function to randomly scroll up or down with a random number of steps
RandomlyScrollMouse() {
    scrollAmount := Random(5, 15)
    direction := Random(1, 2)

    if direction = 1 {
        Send("{WheelUp " scrollAmount "}")
    } else {
        Send("{WheelDown " scrollAmount "}")
    }

    Sleep(Random(500, 1000))
}
