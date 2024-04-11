import requests
import json

base_url = "https://api.pipedrive.com/v1"
endpoints = ["users", "deals", "persons", "notes", "products", "organizations", "activities", "activityfields", "activitytypes", "billing", "callLogs", "channels", "currencies", "DealFields", "deals", "files", "filters", "goals", "İtemSearch", "leads", "LeadLabels", "LeadSources", "LegacyTeams", "mailbox", "meetings", "NoteFields", "notes", "OrganizationFields", "OrganizationRelationShips", "organizations", "PermissionSets", "PersonFields", "persons", "pipelines", "ProductFields", "products", "projects", "ProjectTemplates", "recents", "roles", "stages", "subscriptions", "tasks", "UserConnections", "users", "UsersSettings"]

# Read API tokens from token.txt file
with open("token.txt", "r") as file:
    api_tokens = file.readlines()

def make_api_request(api_token, endpoint):
    url = f"{base_url}/{endpoint}?api_token={api_token.strip()}"
    response = requests.get(url)
    return response.json()

def print_user_info(user_data):
    user_count = len(user_data["data"])

    if user_count == 0:
        print("User not found.")
        return

    print("User Information:")
    print("----------------------")

    for i in range(user_count):
        username = user_data["data"][i]["name"]
        email = user_data["data"][i]["email"]
        phone = user_data["data"][i]["phone"]
        print("Username:", username)
        print("Email:", email)
        print("Phone:", phone)

        # Print API endpoints for each user
        print("API Endpoints:")
        for endpoint in endpoints:
            print(" -", endpoint)

        print("----------------------")

for api_token in api_tokens:
    for endpoint in endpoints:
        user_response_data = make_api_request(api_token, endpoint)
        print_user_info(user_response_data)
