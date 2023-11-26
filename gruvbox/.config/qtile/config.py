from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration

import os
import subprocess

from libqtile import hook

mod = "mod4"
terminal = guess_terminal()

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

keys = [

    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod, "shift"],"Return",lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack",),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    #Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([mod], "Escape", lazy.spawn("rofi -show drun"), desc="Spawn a command using a prompt widget"),
    Key([mod], "b", lazy.spawn("firefox"), desc="Open Browser"),
    Key([mod], "o", lazy.spawn("obsidian"), desc="Launch Notepad(Obsidian))"),
    Key([mod], "e", lazy.spawn("nemo"), desc="Open File Manager"),
    Key([mod], "q", lazy.spawn("kitty"), desc="Launch terminal"),
    Key([mod, "shift"], "s", lazy.spawn("spectacle -r"), desc="Take a screenshot"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
theme = {
        'workspaces':'#fe8019',
        'workspaces-text':'#32302f',
        'focus': '#fbf1c7',
        #'inactive': '#282738',
                
        'layout':'#504945',
        'layout-text':'#d5c4a1',
        
        'windowname':'#282828',
        'windowname-text':'#bdae93',
        
        'systray':'#504945',
        'systray-text':'#d5c4a1',
        
        'ram':'#458588',
        'ram-text':'#32302f',
        
        'volume':'#b16286',
        'volume-text':'#32302f',
        
        'clock':'#689d6a',
        'clock-text':'#32302f',
        
        'border-focus':'#bdae93',
        'border-normal':'#3c3836',
        #'border-focus':'#CAA9E0',
        #'border-normal':'#282738',
}

layouts = [
       layout.Columns( margin= [10,10,10,10], border_focus=theme["border-focus"],border_normal=theme["border-normal"],border_width=2,),
       layout.MonadTall(border_focus=theme["border-focus"],border_normal=theme["border-normal"],margin=10,border_width=2,),
    #  layout.Max(border_focus='#1F1D2E',border_normal='#1F1D2E',margin=10,border_width=0,),
    #  layout.Floating(	border_focus='#1F1D2E',border_normal='#1F1D2E',margin=10,border_width=0,),
    #  layout.Stack(num_stacks=2),
    #  layout.Bsp(),
    #  layout.Matrix(	border_focus='#1F1D2E',border_normal='#1F1D2E',margin=10,border_width=0,),
    #  layout.MonadWide(	border_focus='#1F1D2E',border_normal='#1F1D2E',margin=10,border_width=0,),
    #  layout.RatioTile(),
    #  layout.Tile(	border_focus='#1F1D2E',border_normal='#1F1D2E',),
    #  layout.TreeTab(),
    #  layout.VerticalTile(),
    #  layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=0,
)
extension_defaults = widget_defaults.copy()

powerline = {
    "decorations": [
        PowerLineDecoration(path="arrow_left")
    ]
}

powerline_right = {
    "decorations": [
        PowerLineDecoration(path="arrow_right")
    ]
}
screens = [
    Screen(
        top=bar.Bar(
            [
                #Left Bar
                widget.Spacer(length=10,background=theme["workspaces"]),
                widget.GroupBox(
                    fontsize=24,
                    borderwidth=3,
                    active=theme["workspaces-text"],
                    block_highlight_text_color=theme["focus"],
                    background=theme["workspaces"],
                    this_current_screen_border=theme["workspaces"],
                    disable_drag=True,
                    hide_unused=True,
                    **powerline
                 ),

                #Layout
                widget.Image(filename='~/.config/qtile/Assets/layout.png',background=theme["layout"]),
                widget.CurrentLayout(background=theme["layout"],foreground=theme["layout-text"],**powerline,fmt='{}',font="JetBrains Mono Bold",fontsize=13,),


                #Focus name
                widget.Spacer(length=10,background=theme["windowname"],),
                widget.WindowName(**powerline_right,background=theme["windowname"],format = "{name}",font='JetBrains Mono Bold',foreground=theme["windowname-text"],empty_group_string = 'Desktop',fontsize=13,),

                #Systray
                widget.Systray(background=theme["systray"],fontsize=2),
                widget.TextBox(text=' ',background=theme["systray"],**powerline_right),

                #Ram
                #widget.Image(filename='~/.config/qtile/Assets/6.png',background='#353446',),
                widget.Image(filename='~/.config/qtile/Assets/Misc/ram.png',background=theme["ram"],color=theme["ram"],),
                #widget.Spacer(length=7,background=theme["ram"],),
                widget.Memory(background=theme["ram"],format='{MemUsed: .0f}{mm}',foreground=theme["ram-text"],font="JetBrains Mono Bold",fontsize=13,update_interval=5,),
                widget.Spacer(length=7,background=theme["ram"],**powerline_right),

                #Volume
                widget.Spacer(length=8,background=theme["volume"],),
                widget.Volume(font='JetBrainsMono Nerd Font',theme_path='~/.config/qtile/Assets/Volume/',emoji=True,fontsize=13,background=theme["volume"]),
                #widget.Spacer(length=-5,background=theme["volume"],),
                widget.Volume(font='JetBrains Mono Bold',background=theme["volume"],foreground=theme["volume-text"],fontsize=13),
                widget.Spacer(length=10,background=theme["volume"],**powerline_right),

                #Clock
                widget.Image(filename='~/.config/qtile/Assets/Misc/clock.png',background=theme["clock"],margin_y=5,margin_x=5,),
                widget.Clock(format='%I:%M %p',background=theme["clock"],foreground=theme["clock-text"],font="JetBrains Mono Bold",fontsize=13),
                widget.Spacer(length=18,background=theme["clock"],),
            ],
            30,
            border_width = [0,0,0,0],
            margin = [10,10,0,10],
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width=2,
    border_focus=theme["border-focus"],
    border_normal=theme["border-normal"]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
