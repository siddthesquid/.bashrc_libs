# Tmux

## Theory

`tmux` (Terminal MUltipleXer) provides a keyboard-powered terminal management system. It's like having multiple terminals (e.g. `iTerm`), each running their own process, but with more convenient controls and features like screen-splitting and tabs.

`tmux` itself runs a server that is capable of launching sessions, which hold windows, which manage panes.

* __server__
  * parent process that runs and manages `tmux`
  * gateway to all `tmux` interactions
  * manages multiple sessions
  * always at least one session running. `tmux` exits when all sessions are closed
* __session__
  * a way of managing windows
  * your host terminal attaches to a session when you are using `tmux`
  * you, as a terminal client, attach to a single session via a server
* __window__
  * like tabs within a session
  * takes up the entire terminal screen
  * represents a layout of panes
* __pane__:
  * the actual _pseudoterminal_
  * belongs to a single window
  * each window can have multiple panes
  * each pane can be individually resized

## Basic Usage

You interact with either 
* the pseudoterminal of a pane, the way you would interact with any other terminal normally
* `tmux` directory, via one of three interfaces
  * keybindings - all of which must start with `prefix`
    * `prefix` is `ctrl+b` by default
    * but we usually set it to `ctrl+a`
    * also we usually set `caps lock` to `ctrl`
  * `tmux` commands
    * i.e. `$ tmux <command>`
  * `~/.tmux.conf`, always loaded when starting tmux or with `prefix+r`

## Configuration

## Opinionated Usage

* Each session represents one "project" being worked on
* Each window within a session represents either
  * some sort of "view" of that project
  * some generic tool like a process monitor or spotify-tui
* panes should be preconfigured with some ability to resize. Probably still need an ability to manually create panes for certain views

## References

* [Everything you need to know about `tmux`](https://arcolinux.com/everthing-you-need-to-know-about-tmux-introduction/)
* [`tmux` cheatsheet](https://tmuxcheatsheet.com/)
