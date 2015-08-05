import XMonad hiding ( (|||) )
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Minimize
import XMonad.Layout.LimitWindows
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.LayoutCombinators
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageDocks
import Data.Ratio
import qualified XMonad.Hooks.EwmhDesktops as Emwh

main = xmonad =<< xmobar myConfig 
-- this fucks everything up because stdout goes to xmobar
-- for now i'm launching xmobar the other way
-- main = xmonad myConfig 

myLayouts = minimize (limitWindows 6 $
  spiral (6/7) |||
  ThreeCol 1 (3/100) (1/2) |||
  Tall 1 (3/100) (21/34) |||
  noBorders (fullscreenFull Full))

myConfig = Emwh.ewmh defaultConfig { modMask = mod4Mask,
    manageHook = manageHook defaultConfig <+> composeAll [resource =? "stalonetray" --> doIgnore],
    handleEventHook    = fullscreenEventHook,
    layoutHook = myLayouts,
    terminal = "urxvt"
      --terminal = "gnome-terminal"
  } `additionalKeysP`
    [
      --("M-S-q", do {setLimit 6; sendMessage $ JumpToLayout "Spiral"}),
      ("M-f", sendMessage $ JumpToLayout "Full"),
      ("M-g", sendMessage $ JumpToLayout "ThreeCol"),
      ("M-<Space>", do {setLimit 6; sendMessage $ JumpToLayout "Spiral"}),
      ("M-d",do {setLimit 100; sendMessage $ JumpToLayout "Tall"}),
      ("M-m", withFocused $ minimizeWindow),
      ("M-S-m", sendMessage $ RestoreNextMinimizedWin),
      ("M-=", increaseLimit),
      ("M--", decreaseLimit),
      ("M-b", sendMessage ToggleStruts),
      ("M-u", focusUrgent)]
    `additionalKeys` [((0, 0x1008FF12), spawn "amixer -q set Master toggle")
    , ((0, 0x1008FF11), spawn "amixer -q set Master 10%-")
    , ((0, 0x1008FF13), spawn "amixer -q set Master 10%+")]

--myLayout = avoidStruts (
    --    Tall 1 (3/100) (1/2) |||
--    Mirror (Tall 1 (3/100) (1/2))) |||
--    noBorders (fullscreenFull Ful)