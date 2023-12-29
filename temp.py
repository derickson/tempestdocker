
import requests
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Retrieve values from environment variables
station_number = os.getenv("STATION_NUMBER")
token = os.getenv("TOKEN")

# Construct the URL using the environment variables
url = f"https://swd.weatherflow.com/swd/rest/observations/station/{station_number}?token={token}"

response = requests.get(url)

# Print the response JSON
print(response.json())
