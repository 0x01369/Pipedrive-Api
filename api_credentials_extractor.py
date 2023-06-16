import requests
import json

api_token = "null"
base_url = "https://api.pipedrive.com/v1"
endpoints = ["users", "deals", "persons", "notes", "products", "organizations"]


def make_api_request(endpoint):
    url = f"{base_url}/{endpoint}?api_token={api_token}"
    response = requests.get(url)
    return response.json()


def print_user_info(user_data):
    user_count = len(user_data["data"])

    if user_count == 0:
        print("User not found.")
        exit(0)

    print("User information:")
    print("----------------------")

    for i in range(user_count):
        username = user_data["data"][i]["name"]
        email = user_data["data"][i]["email"]
        phone = user_data["data"][i].get("phone", "N/A")
        print(f"User name: {username}")
        print(f"E-Mail: {email}")
        print(f"Phone: {phone}")
        print("----------------------")


for endpoint in endpoints:
    response_data = make_api_request(endpoint)

    if not response_data:
        print("Could not get a valid response from the API.")
        exit(1)

    print(f"API request result ({endpoint}):")
    print("----------------------")
    print(json.dumps(response_data, indent=4))
    print("----------------------")

user_response_data = make_api_request("users")
print_user_info(user_response_data)
