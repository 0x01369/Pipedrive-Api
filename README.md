# Pipedrive API Token Generator Tool
# Pipedrive API Credentials Extractor Tool

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)


This tool helps you automatically generate an API token for the Pipedrive API. You can use and interact with Pipedrive API using this token.

## How to Use

1. - First, sign in to your Pipedrive account and get your developer API key.
2. - Clone or download this project to your computer.
3. - Go to the project directory and open the terminal.
4. - Enter the following command:

## Pipedrive API Token Generator Tool

```bash
git clone https://github.com/0x01369/Pipedrive-Api.git
cd Pipedrive-Api
chmod 777 api_generators.*
pip install requests

Run it with the coding language you want

bash token_generators.sh
python token_generators.py
php token_generators.php
```
## Output Example
```code
Generated Token: 
API Request URL: https://companydomain.pipedrive.com/v1/deals?api_token=
Response Code: 200
Response Code: 401
```

# Pipedrive API Credentials Extractor

This project contains a simple script that extracts credentials using Pipedrive API. These credentials can be used to integrate your Pipedrive account or to perform other automation tasks using the Pipedrive API.

## How to Use

1. - You need to get an API key from your Pipedrive account. To perform this step, you can follow these steps:
- Sign in to your Pipedrive account.
- Go to Settings > Company settings > API access page.
- Generate a new API key and choose the appropriate permissions for your usage.
- Copy your API key and save it in a text file.

```bash
git clone https://github.com/0x01369/Pipedrive-Api.git
cd Pipedrive-Api
chmod 777 api_credentials_extractor.*
pip install requests

Run it with the coding language you want

api_credentials_extractor.sh
api_credentials_extractor.py
api_credentials_extractor.php
```
## Output Example
```code
user information:
----------------------
User name: TEST TEST
E-Mail: test@test.com
----------------------
User name: TEST TEST
E-Mail: test@test.com
----------------------

```
4. When the script is run, the credentials will be extracted and printed to the console using the Pipedrive API.

## Contributing
Contributions to enhance the functionality or fix any issues with this script are welcome. Feel free to fork this repository, make your changes, and submit a pull request.

## License
This project is licensed under the [MIT License.](LICENSE)
