import requests
import json

PROXIES = ["37101", "37102", "37201", "37202"]
TEST_URL = "http://lumtest.com/myip.json"


def check_proxies():
    for port in PROXIES:
        response = requests.get(url=TEST_URL, proxies={"http": f"http://127.0.0.1:{port}"})

        try:
            extra = f"with {response.json()}"
        except json.JSONDecodeError:
            extra = ""

        print(f"Proxy at port {port} returns {response.status_code} {extra}")


if __name__ == "__main__":
    check_proxies()
