# Rap Generator

This script uses the OpenAI API to generate a song in the style of a given rapper, based on a given topic, and then uses the Uberduck AI TTS service to convert it into a speech and play it.

![Alt text](www/workflow.png?raw=true "Title")


## How it works

The script starts by importing the `openai` library and setting the API key for the OpenAI API. Next, it defines a function called `generate_song()` that takes in two arguments: a `rapper` and a `topic`. This function generates the song using the OpenAI API, it calls the `openai.Completion.create()` method, passing in various parameters such as the prompt, max_tokens, number of text completions, etc. The generatedsong is then returned and is then passed to TTS service.

Next, the script calls the `generate_song()` function with "Kendrick Lamar" and "street life" as the arguments, and assigns the result to the `generated_song` variable.

The script then uses the `requests` library to call the Uberduck TTS service endpoint, passing in the generatedsong,  the singer name and various headers required for the call. The script extracts the `uuid` value from the response, which is a unique identifier for the speech synthesis request and uses it to construct the URL for the `speak-status` endpoint.

Finally, the script uses `requests.get(status_url)` to get the status of the speech synthesis request from the `speak-status` endpoint and prints out the response.The final output can be accessed  trought the url that contains an 'audio.wav' file.

## Requirements

In order to run this script, you will need to have the following installed:
- Python
- OpenAI API key
- Uberduck TTS api key
- requests library
- openai library

You will also need to replace the values of the api keys in the script before running the code.

This script is just an example and you can change the arguments passed to the generate_song function accordingly to get the song generated for the desired rapper and topic.
Also, you can change the singer name for TTS service and also you can change the headers and other parameters for the TTS service api call.

## Conclusion

This script demonstrates how to use the OpenAI API to generate a song in the style of a given rapper and the Uberduck TTS service for converting it into speech and play it. Feel free to play around with the script, and use it as a starting point for your own projects.
