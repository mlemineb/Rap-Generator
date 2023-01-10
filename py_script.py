import openai

# Add your own OpenAI API key here
openai.api_key = "PUT_YOUR_API_KEY_HERE"

def generate_song(rapper, topic):
    prompt = (f"write a {rapper} style song about {topic}")
    completions = openai.Completion.create(engine="text-davinci-002", prompt=prompt, max_tokens=1024, n=1,stop=None,temperature=0.7)
    message = completions.choices[0].text
    return message.strip()
  


singer="Kendrick Lamar"
generated_song = generate_song(singer, "street life")
print(generated_song)

import requests

url = "https://api.uberduck.ai/speak"


payload = {
    "voice": singer,
    "pace": 1,
    "speech": generated_song
}
headers = {
    "accept": "application/json",
    "content-type": "application/json",
    "authorization": "Basic cHViXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # this is just the encoded version of your Uberduck API credentials. You can have it directly on the Uberduck website
}

response = requests.post(url, json=payload, headers=headers)

print(response.text)

# Extract the 'uuid' value from the response
response_data = response.json()
uuid = response_data["uuid"]
uuid

# Use the 'uuid' value in a URL
status_url = f"https://api.uberduck.ai/speak-status?uuid={uuid}"

# Get the status of the speech synthesis request
status_response = requests.get(status_url)
status_data = status_response.json()
print(status_data)
