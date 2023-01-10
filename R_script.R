library(openai)
library(httr)


# Set the API key and model ID for GPT-3
Sys.setenv(OPENAI_API_KEY = "PUT_YOUR_API_KEY_HERE")

# Set the rapper name and topic as variables
rapper_name <- "Kendrick Lamar"
topic <- "social justice"

# Use GPT-3 to generate lyrics for a rap song based on the given rapper name and topic
prompt <- paste("Write a rap song in the style of", rapper_name, "about", topic)
response <- create_completion( model = "text-davinci-002",prompt = prompt, temperature = 0.9,max_tokens = 200)
generated_song <- response$choices$text


url <- "https://api.uberduck.ai/speak"
singer <- "2pac"
payload <- list(voice = singer, pace = 1, speech = generated_song)
headers <- list("accept" = "application/json", "content-type" = "application/json", "authorization" = "Basic XXXXXXXXXXXXXXXXXXXXXXXXXXX")# this is just the encoded version of your Uberduck API credentials. You can have it directly on the Uberduck website
}

response <- POST(url, body = payload, add_headers(headers))

print(content(response))

# Extract the 'uuid' value from the response
response_data <- jsonlite::fromJSON(content(response, "text", encoding = "UTF-8"))
uuid <- response_data$uuid
uuid

# Use the 'uuid' value in a URL
status_url <- paste0("https://api.uberduck.ai/speak-status?uuid=", uuid)

# Get the status of the speech synthesis request
status
