# Compatibility for zshrinkwrap 5063777 with Powerlevel10k's split prompt.
# Keep this in the Zsh configuration, outside Antidote's downloaded plugin cache.
[[ -o interactive ]] || return 0
(( ${_zshrinkwrap_loaded:-0} )) || return 0
(( $+functions[_p9k_precmd] )) || return 0
(( $+functions[_zshrinkwrap_p10k_install] )) ||
  source "$_zshrinkwrap_dir/zshrinkwrap.p10k.zsh"

_zshrinkwrap_p10k_repaint() {
  setopt local_options prompt_subst no_sh_glob no_ksh_glob
  (( _zshrinkwrap_p10k_hidden && ! _zshrinkwrap_active )) || return 0
  local old=$_zshrinkwrap_p10k_printed new line
  local -a widths=( $_zshrinkwrap_upper_widths ) lines
  _zshrinkwrap_p10k_upper_text
  new=$REPLY
  _zshrinkwrap_p10k_hide
  [[ $1 != force && $new == $old ]] && return 0
  # Count lines as an array: a single string's length counts characters.
  lines=( "${(@f)new}" )
  (( $#lines == $#widths )) || return 0
  _zshrinkwrap_p10k_rows $PROMPT
  local -i up=$(( reply[1] + reply[2] ))
  (( up > 0 && up < LINES )) || return 0
  print -rn -- $'\e7\e['$up$'A\r'
  for line in "${lines[@]}"; do
    print -rn -- $'\e[K'$line$'\r\n'
  done
  print -rn -- $'\e8'
  typeset -g _zshrinkwrap_p10k_printed=$new
}

_zshrinkwrap_p10k_after_reset() {
  setopt local_options prompt_subst no_sh_glob no_ksh_glob
  # Powerlevel10k keeps this parameter defined but empty while editing.
  [[ -z $_p9k__line_finished ]] && zle 2>/dev/null || return 0
  (( _zshrinkwrap_p10k_hidden && ! _zshrinkwrap_active )) || return 0
  if [[ $WIDGET == clear-screen ]]; then
    _zshrinkwrap_p10k_rows $PROMPT
    local -i reserve=$(( reply[2] + 1 ))
    zle -I
    echoti clear
    _zshrinkwrap_p10k_print
    # Allow for ZLE's cached prompt and the command rows above the cursor.
    repeat $reserve print -rn -- $'\n'
    zle .reset-prompt
    zle -R
    _zshrinkwrap_p10k_repaint force
  else
    _zshrinkwrap_p10k_repaint force
  fi
}

# Repaint the header at the final width after the resize timer restores input.
# Avoid wrapping a previous copy of this function when the file is sourced again.
if [[ $functions[_zshrinkwrap_split_redraw] != *_zshrinkwrap_compat_split_redraw* ]]; then
  functions[_zshrinkwrap_compat_split_redraw]=$functions[_zshrinkwrap_split_redraw]
fi
_zshrinkwrap_split_redraw() {
  _zshrinkwrap_compat_split_redraw "$@"
  local -i rc=$?
  _zshrinkwrap_p10k_repaint force
  return $rc
}
