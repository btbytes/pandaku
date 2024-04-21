# pandaku

Status: working

An attempt to run `pandoc server` on Docker and subsequently on [fly.io](https://fly.io) as a service inspired by [this tweet](https://twitter.com/btbytes/status/1781580932010439056).

![a daku operating on daks](img/pandaku.jpg)

## Sample code

```python
import requests
import json
import hashlib

def send_request():
    try:
        response = requests.post(
            url="https://pandaku.fly.dev/",
            headers={
                "Content-Type": "application/json; charset=utf-8",
            },
            data=json.dumps({
                "to": "docx",
                "text": "hello world"
            })
        )
        print('Response HTTP Status Code: {status_code}'.format(
            status_code=response.status_code))

        # Save response content to a file named with SHA1 hash
        if response.status_code == 200:
            sha1_hash = hashlib.sha1(response.content).hexdigest()
            with open(f"{sha1_hash}.docx", "wb") as file:
                file.write(response.content)
                print(f"Response content saved to {sha1_hash}.docx")

    except requests.exceptions.RequestException:
        print('HTTP Request failed')

if __name__ == "__main__":
    send_request()
```
## Quick test from the terminal

```sh
curl http://localhost:3030/babelmark\?text\=Hello\!\*\*Pandaku\!\*\*\&to\=docx | jq -r .html | base64 --decode > test.docx
open test.docx
```
