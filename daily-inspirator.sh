#!/bin/bash
# Daily Inspirator - Fetch random inspiration from various free APIs
# Created by BentFreeBird 🦅

echo "🌟 DAILY INSPIRATOR 🌟"
echo "======================="
echo ""

# 1. Get random advice
echo "💡 Random Advice:"
ADVICE=$(curl -s https://api.adviceslip.com/advice | jq -r '.slip.advice' 2>/dev/null)
if [ -n "$ADVICE" ]; then
    echo "   $ADVICE"
else
    echo "   (API unavailable)"
fi
echo ""

# 2. Get random quote
echo "📜 Random Quote:"
QUOTE=$(curl -s https://zenquotes.io/api/random | jq -r '.[0].q' 2>/dev/null)
AUTHOR=$(curl -s https://zenquotes.io/api/random | jq -r '.[0].a' 2>/dev/null)
if [ -n "$QUOTE" ]; then
    echo "   \"$QUOTE\""
    echo "   — $AUTHOR"
else
    echo "   (API unavailable)"
fi
echo ""

# 3. Get random fun fact
echo "🎓 Random Fact:"
FACT=$(curl -s https://uselessfacts.jsph.pl/api/v2/facts/random | jq -r '.text' 2>/dev/null)
if [ -n "$FACT" ]; then
    echo "   $FACT"
else
    echo "   (API unavailable)"
fi
echo ""

# 4. Get random dog image URL
echo "🐕 Dog of the day:"
DOG_URL=$(curl -s https://dog.ceo/api/breeds/image/random | jq -r '.message' 2>/dev/null)
if [ -n "$DOG_URL" ] && [ "$DOG_URL" != "null" ]; then
    echo "   Image: $DOG_URL"
else
    echo "   Trying cat API instead..."
    CAT_URL=$(curl -s https://api.thecatapi.com/v1/images/search | jq -r '.[0].url' 2>/dev/null)
    if [ -n "$CAT_URL" ] && [ "$CAT_URL" != "null" ]; then
        echo "   🐱 Cat Image: $CAT_URL"
    else
        echo "   (No animal API available)"
    fi
fi

# 5. Get random joke
echo ""
echo "😄 Joke of the day:"
JOKE=$(curl -s https://official-joke-api.appspot.com/random_joke | jq -r '.setup' 2>/dev/null)
JOKE_PUNCHLINE=$(curl -s https://official-joke-api.appspot.com/random_joke | jq -r '.punchline' 2>/dev/null)
if [ -n "$JOKE" ]; then
    echo "   $JOKE"
    echo "   ... $JOKE_PUNCHLINE"
else
    echo "   (API unavailable)"
fi
echo ""

echo "✨ Have a great day! ✨"
