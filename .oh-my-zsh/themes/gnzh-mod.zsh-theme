# Based on gnzh theme

export VIRTUAL_ENV_DISABLE_PROMPT=1

prompt_segment() {
  local fg
  if [[ -n $1 ]]; then
    echo -en "%F{$1}$2%f"
  else
    echo -en $2
  fi
}

() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
}

prompt_context() {
  local PR_USER PR_USER_OP PR_PROMPT PR_HOST

  # Check the UID
  if [[ $UID -ne 0 ]]; then # normal user
    prompt_segment green "%n"
  else # root
    prompt_segment red "%n"
  fi

  prompt_segment red "@"

  # Check if we are on SSH or not
  if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    prompt_segment red "%M "
  else
    prompt_segment green "%M "
  fi
}

prompt_dir() {
  prompt_segment blue "%B%~%b "
}

prompt_git() {
  prompt_segment default "$(git_prompt_info)"
}

prompt_virtualenv() {
  [[ -n "$VIRTUAL_ENV" ]] || return
    prompt_segment magenta "(`basename $VIRTUAL_ENV`) "
}

prompt_prefix() {
  prompt_segment white "╭─"
}

prompt_suffix() {
  prompt_segment white "\n╰─➤ "
}

prompt_return_code() {
  echo -en "%(?.."
  prompt_segment red "%? ↵"
  echo -en ")"
}

build_prompt() {
  prompt_prefix
  prompt_virtualenv
  prompt_context
  prompt_dir
  prompt_git
  prompt_suffix
}

# Используйте только одинарные кавычки. Это позволит интерпретировать переменную в последний
# момент при выводе в консоль. Иначе изменения произошедшие локально, не будут учитываться без
# повторного вычисления переменной (R)PROMPT. В частности, возникает проблема при активации
# virtualenv.
PROMPT='$(build_prompt) '
RPROMPT='$(prompt_return_code)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
