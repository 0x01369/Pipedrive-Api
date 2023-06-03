import random
import requests

def generate_api_token(length):
    characters = ["a", "b", "c", "d", "e", "f", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    characters_length = len(characters)

    while True:
        token = ""
        for _ in range(length):
            random_index = random.randint(0, characters_length - 1)
            token += characters[random_index]

        url = "https://api.pipedrive.com/v1/deals?api_token=" + token
        response = requests.get(url).status_code

        print("Generated Token:", token)
        print("API Request URL:", url)
        print("Response Code:", response)

        if response == 200:
            print("Valid API Token Found!")
            break

generate_api_token(40)

