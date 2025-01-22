##!/usr/bin/env sh

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  if [[ $line == "activelayout>>"* ]]; then
    split=(${line//>>/ })
    lang=(${split[1]//,/ })
    language=${lang[1]}
    lang_code=${language:0:2}
    lang_code_lower=$(echo $lang_code | tr '[:upper:]' '[:lower:]')

    if [[ $lang_code_lower == "bu" ]]; then
      lang_code_lower="bg"
    fi

    echo $lang_code_lower
  fi
done
