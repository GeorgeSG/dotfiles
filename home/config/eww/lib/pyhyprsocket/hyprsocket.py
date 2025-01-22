import socket
import os, os.path


def get_socket_path():
    XDG_RUNTIME_DIR = os.getenv("XDG_RUNTIME_DIR")
    HYPRLAND_INSTANCE_SIGNATURE = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")

    socket_path = os.path.join(
        XDG_RUNTIME_DIR, "hypr", HYPRLAND_INSTANCE_SIGNATURE, ".socket2.sock"
    )

    return socket_path


def run_on_line(method):
    server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    server.connect(get_socket_path())

    while True:
        data_chunk = server.recv(4096)
        if data_chunk:
            line = data_chunk.decode("utf-8")
            method(line)
