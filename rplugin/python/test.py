import nbformat
import json
import asyncio
import requests
import uuid
from requests import Response
import websocket
from tornado.escape import url_escape
from tornado.httpclient import HTTPClient, HTTPRequest
from tornado.websocket import websocket_connect

base_url = "http://localhost:8888"
base_ws_url = "ws://localhost:8888"
token = "93abe600246fba73f30816c0c3a6aae7e938154e7c7df1af"

headers = {
    # Jupyter起動時のトークンをセット
    "Authorization": "token "
    + token
}


def get_version() -> dict:
    url = base_url + "/api/"
    return requests.get(url, headers=headers).json()


def get_file(path: str) -> dict:
    url = base_url + "/api/contents/" + path
    return requests.get(url, headers=headers).json()


def get_kernels() -> dict:
    url = base_url + "/api/kernels"
    return requests.get(url, headers=headers).json()


def start_kernels(args: dict | None = None) -> dict:
    """
    print(start_kernels({"name": "test", "path": "test"}))
    """
    url = base_url + "/api/kernels"
    if dict == None:
        return requests.post(url, headers=headers).json()
    return requests.post(
        url, data=json.JSONEncoder().encode(args), headers=headers
    ).json()
    # return requests.get(url, headers=headers).json()


def execute(codes: list[str]):
    url = f"{base_ws_url}/api/kernels/{get_kernels()[0]['id']}/channels?token={token}"
    print(url)
    socket = websocket.create_connection(url, headers=headers)
    print(socket.status)

    for code in codes:
        header = {
            "msg_type": "execute_request",
            "msg_id": uuid.uuid1().hex,
            "session": uuid.uuid1().hex,
        }
        message = json.dumps(
            {
                "header": header,
                "parent_header": header,
                "metadata": {},
                "content": {"code": code, "silent": False},
            }
        )

        # 送信
        socket.send(message)

    # 結果の保持
    outputs = []

    for _ in range(len(codes)):
        msg_type, prev_msg_type = "", ""

        while msg_type != "stream":
            if msg_type != prev_msg_type:
                print(prev_msg_type, "->", msg_type)  # WebSocketの状態遷移をトレース
                prev_msg_type = msg_type

            response = json.loads(socket.recv())  # メッセージを受信
            msg_type = response["msg_type"]

        print(prev_msg_type, "->", msg_type)

        outputs.append(response["content"]["text"])

    # WebSocketをクローズ
    socket.close()

    return outputs


def main():
    # print(get_version()["version"])
    # print(get_file("main.ipynb")["content"])
    # print(get_kernels())
    # print(start_kernels({"name": "test", "path": "test"}))
    # print(start_kernels())
    # asyncio.run(test())
    # print(execute(["import math"]))
    print(execute(["for i in range(10):\n\tprint(i)\n"]))
    # url = base_url + "/api/contents/" + "test.txt"
    # url = base_url + "/api/nbconvert"
    #
    # response = requests.get(url, headers=headers)
    #
    # notebook = json.loads(response.text)
    # print(notebook)


if __name__ == "__main__":
    main()
