# Proxy switcher
proxy() {
  if [[ "$1" = "on" ]]; then
    if [[ "$2" = "" ]]; then
      echo "No port provided"
      return 2
    fi
    # proxy offered by local shadowsocks
    export http_proxy="http://127.0.0.1:$2"
    export https_proxy="http://127.0.0.1:$2"
  elif [[ "$1" = "off" ]]; then
    unset http_proxy
    unset https_proxy
  elif [[ "$1" != "" ]]; then
    echo "Usage: 
        proxy          - view current proxy
        proxy on PORT  - turn on proxy at localhost:PORT
        proxy off      - turn off proxy"
    return 1
  fi
  echo "Current: http_proxy=$http_proxy https_proxy=$https_proxy"
}
