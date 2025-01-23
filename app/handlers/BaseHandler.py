import requests


class Characters:
    name: str
    available: int


class BaseHandler:

    @classmethod
    def message(cls):
        params = {
            "ts": "1",
            "apikey": "de38123c82535d0f2fd3064033495fc9",
            "hash": "b134440b5ecd4909f39883e1d2bc1c2b",
            "upc": "5960605667-00111",
        }
        response = requests.get(
            "http://gateway.marvel.com/v1/public/comics", params=params
        )
        response.raise_for_status()

        comics = response.json()["data"]["results"]

        characters = []
        print(comics)
        for comic in comics:
            characters.append(comic["characters"])

        return characters

    @classmethod
    def get_characters(cls, char_id: int):
        params = {
            "ts": "1",
            "apikey": "de38123c82535d0f2fd3064033495fc9",
            "hash": "b134440b5ecd4909f39883e1d2bc1c2b",
        }
        response = requests.get(
            f"http://gateway.marvel.com/v1/characters/{char_id}", params=params
        )
        response.raise_for_status()

        return response.json()["data"]["results"]
