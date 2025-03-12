# ------------------------------------------------------------------------------
# Copyright (C) 2020-2024 Aditya Shakya <adi1090x@gmail.com>
#
# Forest Theme
# ------------------------------------------------------------------------------

light_value='0.05'
dark_value='0.30'

# Wal
wal -qnte "$1" "$2"
source "$HOME/.cache/wal/colors.sh"
accent="$color13"

# Polybar
polybar_font='Iosevka Nerd Font:size=10;3'

# Rofi
rofi_font='Iosevka 10'
rofi_icon='Papirus-Apps'

# Terminal
terminal_font_name='JetBrainsMono Nerd Font'
terminal_font_size='10'

# Geany
geany_colors='adapta.conf'
geany_font='JetBrains Mono 10'

# Appearance
gtk_font='Noto Sans 9'
gtk_theme='Adapta-Nokto'
icon_theme='Archcraft-Dark'
cursor_theme='Pear'

# Dunst
dunst_width='300'
dunst_height='80'
dunst_offset='10x40'
dunst_origin='top-right'
dunst_font='Iosevka Custom 9'
dunst_border='2'
dunst_separator='2'

# Picom
picom_backend='glx'
picom_corner='0'
picom_shadow_r='14'
picom_shadow_o='0.30'
picom_shadow_x='-12'
picom_shadow_y='-12'
picom_blur_method='none'
picom_blur_strength='0'

# Bspwm
bspwm_fbc="$accent"
bspwm_nbc="$background"
bspwm_abc="$color5"
bspwm_pfc="$color2"
bspwm_border='2'
bspwm_gap='10'
bspwm_sratio='0.50'
