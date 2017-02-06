import XMonad hiding ( (|||) )
import XMonad.Actions.CycleWS
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
import qualified XMonad.StackSet as W
import qualified XMonad.Hooks.EwmhDesktops as Emwh

main = xmonad =<< xmobar myConfig 
-- this fucks everything up because stdout goes to xmobar
-- for now i'm launching xmobar the other way
-- main = xmonad myConfig 

myLayouts = minimize (limitWindows 6 $
  spiral (6/7) |||
  ThreeCol 1 (3/100) (1/2) |||
  Tall 1 (3/100) (21/34) |||
  Mirror (Tall 1 (3/100) (1/2)) |||
  noBorders (fullscreenFull Full))

myConfig = Emwh.ewmh defaultConfig { modMask = mod4Mask,
    manageHook = manageHook defaultConfig <+> composeAll [resource =? "stalonetray" --> doIgnore],
    handleEventHook    = fullscreenEventHook,
    layoutHook = myLayouts,
    terminal = "urxvt"
      --terminal = "gnome-terminal"
  } `additionalKeysP`
    ([
      --("M-S-q", do {setLimit 6; sendMessage $ JumpToLayout "Spiral"}),
      --("M-i", nextWS),
      --("M-o", prevWS),
      ("M-f", sendMessage $ JumpToLayout "Full"),
      ("M-s",do {setLimit 100; sendMessage $ JumpToLayout "Mirror Tall"}),
      ("M-<Space>", sendMessage $ JumpToLayout "ThreeCol"),
      ("M-g", do {setLimit 6; sendMessage $ JumpToLayout "Spiral"}),
      ("M-d",do {setLimit 100; sendMessage $ JumpToLayout "Tall"}),
      ("M-m", withFocused $ minimizeWindow),
      ("M-S-m", sendMessage $ RestoreNextMinimizedWin),
      ("M-=", increaseLimit),
      ("M--", decreaseLimit),
      ("M-b", sendMessage ToggleStruts),
      ("M-u", focusUrgent)]
    ++
      [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
          | (key, scr)  <- zip "wer" [2,0,1] -- was [0..] *** change to match your screen order ***
          , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
      ])
    `additionalKeys` [((0, 0x1008FF12), spawn "amixer -q set Master toggle")
    , ((0, 0x1008FF11), spawn "amixer -q set Master 10%-")
    , ((0, 0x1008FF13), spawn "amixer -q set Master 10%+")]
--laptop stuff
--    `additionalKeys` [((0, 0x1008FF12), spawn "amixer -q -c 1 set Master toggle & amixer -q -c 1 set Speaker on")
--    , ((0, 0x1008FF11), spawn "amixer -q -c 1 set Master 10%-")
--    , ((0, 0x1008FF02), spawn "xbacklight -inc 15")
--    , ((0, 0x1008FF03), spawn "xbacklight -dec 15")
--    , ((0, 0x1008FF13), spawn "amixer -q -c 1 set Master 10%+")]
--
--myLayout = avoidStruts (
    --    Tall 1 (3/100) (1/2) |||
--    Mirror (Tall 1 (3/100) (1/2))) |||
--    noBorders (fullscreenFull Ful)
