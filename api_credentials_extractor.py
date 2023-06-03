import requests

api_token = "null"
api_url = f"https://api.pipedrive.com/v1/users?api_token={api_token}"

# API isteği ile kullanıcıları al
response = requests.get(api_url)
response_data = response.json()

# Check if the response is empty
if not response_data:
    print("Could not get a valid response from the API.")
    exit(1)

# Operations that extract user information
user_count = len(response_data['data'])
if user_count == 0:
    print("User not found.")
    exit(0)

print("user information:")
print("----------------------")

for i in range(user_count):
    username = response_data['data'][i]['name']
    email = response_data['data'][i]['email']

    print(f"User name: {username}")
    print(f"E-Mail: {email}")
    print("----------------------")

